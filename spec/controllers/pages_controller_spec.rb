require 'rails_helper'


RSpec.describe PagesController, type: :request do

  let(:sign_in_as_user) do
    user = User.create(username: "non_admin_user", email: "non_admin_user@user.com", password: "password", admin: false)
    post(user_session_path, params: {user: {email: user.email, password: "password"}})
    return user
  end

  # =============================================================================================== #

  context ':: GET' do
    context ':: ROOT (HOME) request tests' do
      it ':: should get root page' do
        get root_path
        expect(response).to be_successful
      end

      it ':: should get root page (for signed-in users)' do
        sign_in_as_user

        get root_path
        expect(response).to be_successful
      end
    end
  end

  # =============================================================================================== #


end
