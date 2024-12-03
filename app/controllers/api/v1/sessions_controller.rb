class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by("username = ? OR email = ?", params[:login], params[:login])

    if user && user.authenticate(params[:password])
      # Gerar token ou iniciar sessão, conforme sua implementação
      render json: { message: "Login successful" }, status: :ok
    else
      render json: { error: "Invalid login or password" }, status: :unauthorized
    end
  end
end
