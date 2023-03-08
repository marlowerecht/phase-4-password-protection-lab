class UsersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    before_action :authorize, only: [:show]

    def create
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user, status: :ok
    end

    def 

    private

    def render_unprocessable_entity_response invalid
        render json: { error: invalid.record.errors }, status: :unprocessable_entity
    end

    def user_params
        params.permit(:username, :password)
    end

    def authorize
        return render json: {error: "Not authorized"}, status: :unauthorized, unless session.include? :user_id
    end
end
