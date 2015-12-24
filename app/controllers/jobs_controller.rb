class JobsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show, :home]

  def index
    @search = Job.search(params[:q])
    @jobs = @search.result.paginate(page: params[:page], per_page: 15).order("created_at DESC")

    ###Find Countries That Have Job Posts - Used for filter option
  	@jobs_all = Job.where(["created_at > ?", 30.days.ago]).order("created_at DESC")

    @countries = []
    @jobs_all.each do |job|
      @countries << job.country_id
    end
    @countries_uniq = @countries.uniq.sort_by!{|e| e.downcase}
  end

  def home
  
  end

  def new
  	@job = current_user.jobs.build 
  end

  def show
  	@job = Job.find(params[:id])
  end

  def create
  	@job = current_user.jobs.build(post_params)
  	if @job.save
  		redirect_to jobs_path
  	else
  		render new_job_path
  	end
  end

  ####### PRIVATE ######

  private 

  	def post_params
  		params.require(:job).permit(:title, :description, :city_id, :country_id, :qualifications, :salary_low, :salary_high, :benefits_description, :benefits_airfare, :benefits_housing, :benefits_medical, :benefits_pto, :benefits_sick, :additional_info, :how_to)
  	end

end
