class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Account has been created successfully"
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
      flash[:success] = "Account updates successfully"
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  private
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end

end
