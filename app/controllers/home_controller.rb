class HomeController < ApplicationController
  def index
    @jobs = Job.all.order('created_at desc')
    @companies = Company.all
   	@categories = Category.all
  end
end
