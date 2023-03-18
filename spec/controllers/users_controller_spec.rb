require 'rails_helper'


RSpec.describe UsersController, type: :request do

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
        get user_index_path
        expect(response).to be_successful
      end

      it ':: should get index (for signed-in users)' do
        sign_in_as_user

        get user_index_path
        expect(response).to be_successful
      end
    end

    context ':: SHOW request tests' do
      let(:dummy_user) {User.create(username: "test", email: "test@test.com", password: "password", admin: false)}

      it ':: should get show' do
        get user_path(dummy_user)

        expect(response).to be_successful
        expect(response.body).to include(dummy_user.username)
      end

      it ':: should get show (for signed-in users)' do
        sign_in_as_user

        get user_path(dummy_user)

        expect(response).to be_successful
        expect(response.body).to include(dummy_user.username)
      end
    end

    context ':: EDIT request tests' do
      let(:dummy_user) {User.create(username: "test", email: "test@test.com", password: "password", admin: false)}

      it ':: should not get edit (for non-signed-in users)' do
        get edit_user_path(dummy_user)
        expect(response).to_not be_successful
      end

      it ':: should not get edit for other users (for signed-in users)' do
        sign_in_as_user

        get edit_user_path(dummy_user)
        expect(response).to_not be_successful
      end

      it ':: should get edit for your own profile (for signed-in users)' do
        sign_in_as_user

        get edit_user_registration_path
        expect(response).to be_successful
      end


      it ':: should get edit (for admins)' do
        sign_in_as_admin

        get edit_user_path(dummy_user)
        expect(response).to be_successful
      end
    end
  end

  # =============================================================================================== #

  context ':: PATCH' do
    context ':: UPDATE request tests' do
      let!(:dummy_user) {User.create(username: 'test', email: 'test@test.com', password: 'password', admin: false)}

      it ':: should update user profile (for admins)' do
        sign_in_as_admin

        before_user_count = User.count
        patch user_path(dummy_user), params: {user: {username: 'new name'}}

        expect(User.count - before_user_count).to eq(0)
        expect(response).to redirect_to(user_path(dummy_user))

        follow_redirect!
        expect(response.body).to include('new name')
      end

      it ':: should not update other users profile (for signed-in users)' do
        signed_in_user = sign_in_as_user

        before_user_count = User.count
        patch user_path(dummy_user), params: {user: {username: 'new name'}}

        expect(User.count - before_user_count).to eq(0)
        expect(response).to redirect_to(user_path(dummy_user))

        follow_redirect!
        expect(response.body).to include('test')
      end

      it ':: should update own profile (for signed-in users)' do
        signed_in_user = sign_in_as_user

        before_user_count = User.count
        patch user_registration_path, params: {user: {username: 'new name', current_password: 'password'}}

        expect(User.count - before_user_count).to eq(0)
        expect(response).to redirect_to(root_path)

        follow_redirect!
        expect(response.body).to include('Your account has been updated successfully.')
      end

      it ':: should not update users (for non-signed-in users)' do
        before_user_count = User.count
        patch user_path(dummy_user), params: {user: {username: 'new name', email: 'new_user@test.com'}}

        expect(User.count - before_user_count).to eq(0)
        expect(response).to redirect_to(user_path(dummy_user))
      end
    end
  end

  # =============================================================================================== #

end
