class JobsController < ApplicationController
  before_action :target_job, only: [:show, :edit, :update]
  before_action :companies_list, only: [:new, :edit]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)

    if @job.persisted?
      redirect_to job_path(@job)
    else
      companies_list

      flash.now[:notice] = "Não foi possível criar a vaga"

      render :new
    end
  end

  def edit
  end

  def update
    @job.update(job_params)

    if @job.valid?
      redirect_to job_path(@job)
    else
      redirect_to edit_job_path(@job), notice: 'Não foi possível atualizar a vaga'
    end
  end

  private

  def companies_list
    @companies = Company.all
  end

  def target_job
    @job = Job.find params[:id]
  end

  def job_params
    params.require(:job).permit(:title, :location, :category, :company, :description, :featured, :company_id)
  end
end
