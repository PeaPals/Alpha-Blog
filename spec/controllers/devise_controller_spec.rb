require 'rails_helper'



RSpec.describe DeviseController, type: :request do

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
    context ':: NEW request tests' do
      it ':: should get new user session' do
        get new_user_session_path
        expect(response).to be_successful
      end

      it ':: should get new user registration' do
        get new_user_registration_path
        expect(response).to be_successful
      end
    end

    context ':: EDIT request tests' do
      it ':: should get edit for own account (for signed-in users)' do
        sign_in_as_user

        get edit_user_registration_path
        expect(response).to be_successful
      end

      it ':: should not get edit (for non-signed-in users)' do
        get edit_user_registration_path
        expect(response).to_not be_successful
      end
    end
  end


  # =============================================================================================== #

  context ':: POST' do
    context ':: CREATE request tests' do
      it ':: should create new registration' do
        # make a new user
        user = User.new(username: 'username', email: 'email@email.com', password: 'password')

        # make a new registration
        post(user_registration_path, params: {user: {username: user.username, email: user.email, password: user.password, password_confirmation: user.password}})

        # validations
        expect(response).to redirect_to(root_path)
      end

      it ':: should create login session (for registered-users)' do
        sign_in_as_user

        # validations
        expect(response).to redirect_to(root_path)
      end
    end
  end

  # =============================================================================================== #

  context ':: PATCH' do
    context ':: UPDATE request tests' do
      it ':: should update own registration (for signed-in users)' do
        user = sign_in_as_user

        patch user_registration_path, params: {user: {username: 'new username', current_password: 'password'}}

        expect(response).to redirect_to(root_path)
      end

      it ':: should not update registration (for non-signed in users)' do
        patch user_registration_path, params: {user: {username: 'new username', current_password: 'password'}}

        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  # =============================================================================================== #

  context ':: DELETE' do
    context ':: DESTROY request tests' do
      it ':: should destroy current user account (for signed-in users)' do
        sign_in_as_user

        # delete account
        delete user_registration_path

        # validations
        expect(response.code).to_not eq(422)
        expect(response).to redirect_to(root_path)
      end

      it ':: should destroy current user session (for signed-in users)' do
        sign_in_as_user

        # delete account
        delete destroy_user_session_path

        # validations
        expect(response.code).to_not eq(422)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  # =============================================================================================== #
end
