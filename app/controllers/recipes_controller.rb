class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)
    if @recipe.save
      flash[:success] = "Successfully created..."
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
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
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :describtion)
    end

end
