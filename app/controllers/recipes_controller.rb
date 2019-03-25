class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(quantity: 1)
    @recipe.ingredients.build(quantity: 2)
  end

  def create
  end

  private

  def person_params
    params.require(:recipe).permit(:title, ingredients_attributes: [
                                            :name,
                                            :quantity
                                          ])
  end
end
