class JobsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

  def index
  	@jobs = Job.where(["created_at > ?", 30.days.ago]).order("created_at DESC")
  	@job = Job.new
  end

  def new
  	@job = current_user.jobs.build 

  	@job = Job.new
  end

  def show
  	@job = Job.find(params[:id])
  end

  def create
  	# render plain: params
  	@job = current_user.jobs.build(post_params)
  	if @job.save
  		redirect_to root_path
  	else
  		render new_job_path
  	end
  end

  ####### PRIVATE ######

  private 

  	def post_params
  		params.require(:job).permit(:title, :description)
  	end

end
