class ChefsController < ApplicationController

  def index
    #code
  end

  def show
    #code
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Account has been created successfully"
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end

end
