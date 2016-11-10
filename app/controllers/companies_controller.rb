class CompaniesController < ApplicationController
  before_action :get_company, only: [:show, :edit, :update]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to company_path(@company)
    else
      flash.now[:notice] = "Não foi possível criar a empresa"

      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      flash.now[:notice] = "Não foi possível atualizar a empresa"

      render :edit
    end
  end

  private

  def get_company
    @company = Company.find params[:id]
  end

  def company_params
    params.require(:company).permit(
      :name,
      :location,
      :mail,
      :phone
    )
  end
end
