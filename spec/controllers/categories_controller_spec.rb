require 'rails_helper'



RSpec.describe CategoriesController, type: :request do

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
    context ':: INDEX request tests' do
      it ':: should get index' do
        get categories_path
        expect(response).to be_successful
      end

      it ':: should get index (for signed-in users)' do
        sign_in_as_user

        get categories_path
        expect(response).to be_successful
      end
    end

    context ':: SHOW request tests' do
      let(:category) {Category.create(name: 'Category name')}

      it ':: should get show' do
        get category_path(category)
        expect(response).to be_successful
        expect(response.body).to include('Category name')
      end

      it ':: should get show (for signed-in users)' do
        sign_in_as_user

        get category_path(category)
        expect(response).to be_successful
        expect(response.body).to include('Category name')
      end
    end

    context ':: NEW request tests' do
      it ':: should get new (for admins)' do
        sign_in_as_admin

        get new_category_path
        expect(response).to be_successful
      end

      it ':: should not get new (for signed-in users)' do
        sign_in_as_user

        get new_category_path
        expect(response).to_not be_successful
      end

      it ':: should not get new (for non-signed-in users)' do
        get new_category_path
        expect(response).to_not be_successful
      end
    end

    context ':: EDIT request tests' do
      let(:category) {Category.create(name: 'Category name')}

      it ':: should get edit (for admins)' do
        sign_in_as_admin

        get edit_category_path(category)
        expect(response).to be_successful
      end

      it ':: should not get edit (for signed-in users)' do
        sign_in_as_user

        get edit_category_path(category)
        expect(response).to_not be_successful
      end

      it ':: should not get edit (for non-signed-in users)' do
        get edit_category_path(category)
        expect(response).to_not be_successful
      end
    end
  end


  # =============================================================================================== #

  context ':: POST' do
    context ':: CREATE request tests' do
      it ':: should create category (for admins)' do
        sign_in_as_admin

        before_category_count = Category.count
        post categories_path, params: {category: {name: 'Category name'}}

        expect(Category.count - before_category_count).to eq(1)
        expect(response).to redirect_to(category_path(Category.last))

        follow_redirect!
        expect(response.body).to include('Category name')
      end

      it ':: should not create category (for signed-in users)' do
        sign_in_as_user

        before_category_count = Category.count
        post categories_path, params: {category: {name: 'Category name'}}

        expect(Category.count - before_category_count).to eq(0)
        expect(response).to redirect_to(categories_path)
      end

      it ':: should not create category (for non-signed-in users)' do
        before_category_count = Category.count
        post categories_path, params: {category: {name: 'Category name'}}

        expect(Category.count - before_category_count).to eq(0)
        expect(response).to redirect_to(categories_path)
      end
    end
  end

  # =============================================================================================== #

  context ':: PATCH' do
    context ':: UPDATE request tests' do
      let!(:category) {Category.create(name: 'Category name')}

      it ':: should update category (for admins)' do
        sign_in_as_admin

        before_category_count = Category.count
        patch category_path(category), params: {category: {name: 'Edited category name'}}

        expect(Category.count - before_category_count).to eq(0)
        expect(response).to redirect_to(category_path(category))

        follow_redirect!
        expect(response.body).to include('Edited category name')
      end

      it ':: should not update category (for signed-in users)' do
        sign_in_as_user

        before_category_count = Category.count
        patch category_path(category), params: {category: {name: 'Edited category name'}}

        expect(Category.count - before_category_count).to eq(0)
        expect(response).to redirect_to(categories_path)
      end

      it ':: should not update category (for non-signed-in users)' do
        before_category_count = Category.count
        patch category_path(category), params: {category: {name: 'Edited category name'}}

        expect(Category.count - before_category_count).to eq(0)
        expect(response).to redirect_to(categories_path)
      end
    end
  end

  # =============================================================================================== #

end
