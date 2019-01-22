class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.create(c_params)
    # redirect_to category_path(@category)
  end 

  def edit
    category@ = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(params.require(:category))
    # redirect_to category_path(@category)
  end

  private

  def c_params
    params.require(:category).permit(:name)
   end
end
