class Follow < ApplicationRecord
  belongs_to :following_user, foreign_key: :following_user_id, class_name: "User"
  belongs_to :followed_user, foreign_key: :followed_user_id, class_name: "User"
end
