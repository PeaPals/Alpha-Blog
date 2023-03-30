class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save {self.email = email.downcase}

  has_many :articles, dependent: :destroy

  validates :username, presence: true,
                       uniqueness: {case_sensitive: false},
                       length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 105},
                    format: {with: VALID_EMAIL_REGEX}


  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :following_user

  #####################

  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :following_user_id, class_name: "Follow"

  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed_user
end
