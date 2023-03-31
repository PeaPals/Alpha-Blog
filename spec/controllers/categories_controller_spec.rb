require 'rails_helper'



RSpec.describe CategoriesController, type: :request do

  let(:sign_in_as_user) do
    user = User.create(username: "non_admin_user", email: "non_admin_user@user.com", password: "password")
    post(user_session_path, params: {user: {email: user.email, password: "password"}})
    return user
  end

  # =============================================================================================== #

  context ':: GET' do
    context ':: INDEX request tests' do
      it ':: should not get index (for non-signed-in user)' do
        get categories_path
        expect(response).to_not be_successful
      end

      it ':: should get index (for signed-in users)' do
        sign_in_as_user

        get categories_path
        expect(response).to be_successful
      end
    end

    context ':: SHOW request tests' do
      let(:category) {Category.create(name: 'Category name')}

      it ':: should not get show (for non-signed-in user)' do
        get category_path(category)
        expect(response).to_not be_successful
      end

      it ':: should get show (for signed-in users)' do
        sign_in_as_user

        get category_path(category)
        expect(response).to be_successful
        expect(response.body).to include('Category name')
      end
    end
  end

  # =============================================================================================== #

end
