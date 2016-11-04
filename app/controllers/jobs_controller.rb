class JobsController < ApplicationController
  before_action :target_job, only: [:show]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)

    redirect_to job_path(@job)
  end

  private

  def target_job
    @job = Job.find params[:id]
  end

  def job_params
    params.require(:job).permit(:title, :location, :category, :company, :description)
  end
end
