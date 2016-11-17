class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :edit, :update]

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_path(@category)
    else
      flash.now[:notice] = "Não foi possível criar a categoria"

      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to edit_category_path(@category)
    else
      flash.now[:notice] = "Não foi possível atualizar a categoria"

      render :edit
    end    
  end

  private

  def get_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
