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
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Successfully updates..."
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    #code
  end

  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    if like.valid?
      flash[:success] = "done"
      redirect_back fallback_location: like_recipe_path(@recipe)
    else
      flash[:danger] = "like/dislike once"
      redirect_back fallback_location: like_recipe_path(@recipe)
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :describtion)
    end

end
