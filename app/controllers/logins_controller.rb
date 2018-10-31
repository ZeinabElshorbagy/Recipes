class LoginsController < ApplicationController

  def new
  end

  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      redirect_to recipes_path
    else
      flash.now[:danger] = "email or password are not correct"
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    redirect_to root_path
  end

end
