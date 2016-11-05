class CompaniesController < ApplicationController
  before_action :target_company, only: [:show]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)

    if @company.persisted?
      redirect_to company_path(@company)
    else
      flash.now[:notice] = "Não foi possível criar a empresa"

      render :new
    end
  end

  private

  def target_company
    @company = Company.find params[:id]
  end

  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end
end
