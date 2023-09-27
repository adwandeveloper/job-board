module Api
  module V1

    class UsersController < ApplicationController

      def create
        @user = User.new(user_params)
        @user.user_type = UserConstants::SEEKER_TYPE
        if @user.save
          render_json(@user, :created)
        else
          render_json({ errors: @user.errors.full_messages }, :unprocessable_entity)
        end
      end

      def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
          render_json({ token: @user.authentication_token })
        else
          render_json({ error: 'Invalid email or password' }, :unauthorized)
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :user_type, :password, :password_confirmation)
      end
    end
  end
end
