class SubscriptionsController < ApplicationController

	before_action :authenticate_user!, except: [:new]
	before_action :redirect_to_signup, only: [:new]

	def show
	end

	def new
	end

	def charge

	# If I turn off the job post in JS, the money goes through...
		begin
			Stripe::Charge.create(
			    amount: 77, # amount in cents, again
			    currency: "usd",
			    source: params[:stripeToken],
			    description: "Example charge"
	  		)

			current_user.update(
				stripe_id: params[:stripeId],
				stripe_subscription_id: nil,
				card_last4: params[:card_last4],
				card_exp_month: params[:card_exp_month],
				card_exp_year: params[:card_exp_year],
				card_brand: params[:card_brand]
			)

			redirect_to root_path
  		rescue Stripe::StripeError => e
		    @error = e
		    flash[:notice] = 'Some error occurred.'
		    redirect_to root_path
		end
	end

	def create
		begin
			customer = 	if current_user.stripe_id?
							Stripe::Customer.retrieve(current_user.stripe_id)
						else
							Stripe::Customer.create(email: current_user.email)
						end

			subscription = customer.subscriptions.create(
				source: params[:stripeToken],
				plan: "monthly"
			)

			current_user.update(
				stripe_id: customer.id,
				stripe_subscription_id: subscription.id,
				card_last4: params[:card_last4],
				card_exp_month: params[:card_exp_month],
				card_exp_year: params[:card_exp_year],
				card_brand: params[:card_brand]
			)


		rescue Stripe::StripeError => e
			@error = e
			flash[:notice] = 'Some error occurred.'
		end
			redirect_to root_path
	end

	def destroy
	end

	private

	def redirect_to_signup
		if !user_signed_in?
			session["user_return_to"] = new_subscriptions_path
			redirect_to new_user_registration_path
		end
	end

end
