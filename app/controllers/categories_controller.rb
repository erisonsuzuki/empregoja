class CategoriesController < ApplicationController
  before_action :get_category, only: [:show]

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.persisted?
      redirect_to company_path(@category)
    else
      flash.now[:notice] = "Não foi possível criar a categoria"

      render :new
    end
  end

  private

  def get_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:company).permit(:name)
  end
end
