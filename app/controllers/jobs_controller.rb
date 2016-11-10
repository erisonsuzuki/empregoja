class JobsController < ApplicationController
  before_action :get_job, only: [:show, :edit, :update]
  before_action :set_variables, only: [:new, :edit]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to job_path(@job)
    else
      set_variables

      flash.now[:notice] = "Não foi possível criar a vaga"

      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      redirect_to edit_job_path(@job), notice: 'Não foi possível atualizar a vaga'
    end
  end

  private

  def set_variables
    @companies = Company.all
    @categories = Category.all
  end

  def get_job
    @job = Job.find params[:id]
  end

  def job_params
    params.require(:job).permit(
      :title,
      :location,
      :category,
      :company,
      :description,
      :featured,
      :company_id,
      :category_id
    )
  end
end
