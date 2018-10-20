class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    #code
  end

  def create
    #code
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

end
