class HomeController < ApplicationController
  def index
    @jobs = Job.order('created_at desc')
    @companies = Company.all
   	@categories = Category.all
  end
end
