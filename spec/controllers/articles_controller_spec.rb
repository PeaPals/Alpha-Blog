require 'rails_helper'



RSpec.describe ArticlesController, type: :request do

  let(:sign_in_as_admin) do
    user = User.create(username: "admin_user", email: "admin_user@user.com", password: "password", admin: true)
    post(user_session_path, params: {user: {email: user.email, password: "password"}})
    return user
  end

  let(:sign_in_as_user) do
    user = User.create(username: "non_admin_user", email: "non_admin_user@user.com", password: "password", admin: false)
    post(user_session_path, params: {user: {email: user.email, password: "password"}})
    return user
  end

  # =============================================================================================== #

  context ':: GET' do

    let(:article) do
      user = User.create(username: 'username', email: 'email@email.com', password: 'password')
      article = Article.create(title: 'title-title', description: 'description-description', user: user)
      return article
    end

    context ':: INDEX request tests' do
      it ':: should get index' do
        get articles_path
        expect(response).to be_successful
      end

      it ':: should get index (for signed-in users)' do
        sign_in_as_user

        get articles_path
        expect(response).to be_successful
      end
    end

    context ':: SHOW request tests' do
      it ':: should get show' do
        article
        get article_path(article)

        expect(response).to be_successful

        expect(response.body).to include('title-title')
        expect(response.body).to include('description-description')
        expect(response.body).to include('username')
      end

      it ':: should get show (for signed-in users)' do
        sign_in_as_user

        article
        get article_path(article)

        expect(response).to be_successful

        expect(response.body).to include('title-title')
        expect(response.body).to include('description-description')
        expect(response.body).to include('username')
      end
    end

    context ':: NEW request tests' do
      it ':: should get new (for admins)' do
        sign_in_as_admin

        get new_article_path
        expect(response).to be_successful
      end

      it ':: should get new (for signed-in users)' do
        sign_in_as_user

        get new_article_path
        expect(response).to be_successful
      end

      it ':: should not get new (for non-signed-in users)' do
        get new_article_path
        expect(response).to_not be_successful
      end
    end

    context ':: EDIT request tests' do
      it ':: should get edit (for admins)' do
        sign_in_as_admin

        get edit_article_path(article)
        expect(response).to be_successful
      end

      it ':: should not get edit for other users articles (for signed-in users)' do
        sign_in_as_user

        get edit_article_path(article)
        expect(response).to_not be_successful
      end

      it ':: should get edit for own articles (for signed-in users)' do
        # signing in user of the article
        post(user_session_path, params: {user: {email: article.user.email, password: 'password'}})

        get edit_article_path(article)
        expect(response).to be_successful
      end

      it ':: should not get edit (for non-signed-in users)' do
        get edit_article_path(article)
        expect(response).to_not be_successful
      end
    end
  end


  # =============================================================================================== #

  context ':: POST' do
    context ':: CREATE request tests' do
      it ':: should create article (for admins)' do
        sign_in_as_admin

        before_article_count = Article.count
        post articles_path, params: {article: {title: 'Article title', description: 'Article description', category_ids: []}}

        expect(Article.count - before_article_count).to eq(1)
        expect(response).to redirect_to(article_path(Article.last))

        follow_redirect!

        expect(response.body).to include('Article title')
        expect(response.body).to include('Article description')
        expect(response.body).to include('admin_user')
      end

      it ':: should create article (for signed-in users)' do
        sign_in_as_user

        before_article_count = Article.count
        post articles_path, params: {article: {title: 'Article title', description: 'Article description', category_ids: []}}

        expect(Article.count - before_article_count).to eq(1)
        expect(response).to redirect_to(article_path(Article.last))

        follow_redirect!

        expect(response.body).to include('Article title')
        expect(response.body).to include('Article description')
        expect(response.body).to include('non_admin_user')
      end

      it ':: should not create article (for non-signed-in users)' do
        before_article_count = Article.count
        post articles_path, params: {article: {title: 'Article title', description: 'Article description', category_ids: []}}

        expect(Article.count - before_article_count).to eq(0)
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  # =============================================================================================== #

  context ':: PATCH' do
    context ':: UPDATE request tests' do

      let!(:article) do
        user = User.create(username: 'username', email: 'email@email.com', password: 'password')
        article = Article.create(title: 'title-title', description: 'description-description', user: user)
        return article
      end

      it ':: should update article (for admins)' do
        sign_in_as_admin

        before_article_count = Article.count
        patch article_path(article), params: {article: {title: 'edited title-title'}}

        expect(Article.count - before_article_count).to eq(0)
        expect(response).to redirect_to(article_path(article))

        follow_redirect!
        expect(response.body).to include('edited title-title')
      end

      it ':: should update for own articles (for signed-in users)' do
        # signing in user of the article
        post(user_session_path, params: {user: {email: article.user.email, password: 'password'}})

        before_article_count = Article.count
        patch article_path(article), params: {article: {title: 'edited title-title'}}

        expect(Article.count - before_article_count).to eq(0)
        expect(response).to redirect_to(article_path(article))

        follow_redirect!
        expect(response.body).to include('edited title-title')
      end


      it ':: should not update for other users articles (for signed-in users)' do
        sign_in_as_user

        before_article_count = Article.count
        patch article_path(article), params: {article: {title: 'edited title-title'}}


        expect(Article.count - before_article_count).to eq(0)
        expect(response).to redirect_to(article_path(article))

        follow_redirect!
        expect(response.body).to include('title-title')
      end

      it ':: should not update article (for non-signed-in users)' do
        before_article_count = Article.count
        patch article_path(article), params: {article: {description: 'edited description-description'}}

        expect(Article.count - before_article_count).to eq(0)
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  # =============================================================================================== #

  context ':: DELETE' do
    context ':: DESTROY request tests' do

      let!(:article) do
        user = User.create(username: 'username', email: 'email@email.com', password: 'password')
        article = Article.create(title: 'title-title', description: 'description-description', user: user)
        return article
      end

      it ':: should destroy article (for admins)' do
        sign_in_as_admin

        before_article_count = Article.count
        delete article_path(article)

        expect(Article.count - before_article_count).to eq(-1)
        expect(Article.find_by_id(article.id)).to eq(nil)
        expect(response).to redirect_to(articles_path)
      end

      it ':: should destroy for own articles (for signed-in users)' do
        # signing in user of the article
        post(user_session_path, params: {user: {email: article.user.email, password: 'password'}})

        before_article_count = Article.count
        delete article_path(article)

        expect(Article.count - before_article_count).to eq(-1)
        expect(Article.find_by_id(article.id)).to eq(nil)
        expect(response).to redirect_to(articles_path)
      end


      it ':: should not destroy for other users articles (for signed-in users)' do
        sign_in_as_user

        before_article_count = Article.count
        delete article_path(article)

        expect(Article.count - before_article_count).to eq(0)
        expect(Article.find_by_id(article.id)).to_not eq(nil)
        expect(response).to redirect_to(article_path(article))
      end

      it ':: should not destroy article (for non-signed-in users)' do
        before_article_count = Article.count
        delete article_path(article)

        expect(Article.count - before_article_count).to eq(0)
        expect(Article.find_by_id(article.id)).to_not eq(nil)
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  # =============================================================================================== #
end
