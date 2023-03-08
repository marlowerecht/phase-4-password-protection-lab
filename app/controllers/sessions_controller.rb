class SessionController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticat(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {error: "Invalid username or passowrd"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

end
