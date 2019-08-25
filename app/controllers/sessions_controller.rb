class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_paht, notice: 'ろぐいんしました。'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
