class JobsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show, :home]

    def index
        @search = Job.search(params[:q])
        @jobs = @search.result.paginate(page: params[:page], per_page: 30).order("created_at DESC").where(["created_at > ?", 30.days.ago]).order("created_at DESC")


        ###Find Countries That Have Job Posts - Used for filter option
  	    @jobs_all = Job.where(["created_at > ?", 30.days.ago]).order("created_at DESC")

        @countries = []
        @jobs_all.each do |job|
            @countries << job.country_id
        end
        @countries_uniq = @countries.uniq.sort_by!{|e| e.downcase}
    end

    def new
      	@job = current_user.jobs.build 
    end

    def show
      	@job = Job.find(params[:id])
    end

    def create
        @job = current_user.jobs.build(post_params)
        charge_error = nil

        if @job.valid? 
            begin
                customer =  if current_user.stripe_id?
                                Stripe::Customer.retrieve(current_user.stripe_id)
                            else
                                Stripe::Customer.create(
                                    email: current_user.email,
                                    source: params[:stripeToken],
                                    description: "Standard Charge Customer"
                                )                 
                            end

                current_user.update(
                    stripe_id: customer.id,
                    stripe_subscription_id: nil,
                    card_last4: params[:card_last4],
                    card_exp_month: params[:card_exp_month],
                    card_exp_year: params[:card_exp_year],
                    card_brand: params[:card_brand]
                )

                Stripe::Charge.create(
                    amount: 1600, # amount in cents, again
                    currency: "usd",
                    customer: customer.id,
                    description: "Standard job posting"
                )

                flash[:notice] = 'Job has been successfully posted!'

            rescue Stripe::StripeError => e
                    charge_error = e.message
            end

            if charge_error
                flash[:alert] = charge_error
                render :new
            else
                @job.save
                redirect_to jobs_path
            end
        
        else
            flash[:alert] = 'One or more errors in your order'
            render :new
        end

    end

  ####### PRIVATE ######

  private 

    def post_params
        params.require(:job).permit(:title, :description, :city_id, :country_id, :qualifications, :salary_low, :salary_high, :benefits_description, :benefits_airfare, :benefits_housing, :benefits_medical, :benefits_pto, :benefits_sick, :additional_info, :how_to)
    end

end
