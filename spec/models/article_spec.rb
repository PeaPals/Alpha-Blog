require 'rails_helper'


RSpec.describe Article, type: :model do

  let(:article) do
    user = User.new(username: "username", email: "test@email.com", password: "123456")
    article = Article.new(title: "some title", description: "some description")

    article.user = user
    return article
  end


  context ":: general validation test" do

    it ":: article should be valid" do
      expect(article).to be_valid
    end

    it ":: title should be valid" do
      article.title = nil
      expect(article).to_not be_valid
    end

    it ":: description should be valid" do
      article.description = nil
      expect(article).to_not be_valid
    end

    it ":: user should be valid" do
      expect(article.user).to be_valid
    end

  end


  context ":: title validation tests" do

    it ":: title should be present" do
      article.title = " "
      expect(article).to_not be_valid
    end

    it ":: title length can be greater than 6" do
      article.title = "aa"
      expect(article).to_not be_valid
    end

    it ":: title length can be equal than 6" do
      article.title = "aaabbb"
      expect(article).to be_valid
    end

    it ":: title length can be smaller than 40" do
      article.title = "a" * 41
      expect(article).to_not be_valid
    end

    it ":: title length can be equal to 40" do
      article.title = "a" * 40
      expect(article).to be_valid
    end
  end


  context ":: user_id validation tests" do
    it ":: user must exist" do
      article.user = nil
      expect(article).to_not be_valid
    end
  end


  context ":: description validation tests" do

    it ":: ensure description is present" do
      article.description = " "
      expect(article).not_to be_valid
    end

    it ":: ensure description to have minimum length of 15" do
      article.description = 'd' * 14
      expect(article).not_to be_valid
    end
  end

end
