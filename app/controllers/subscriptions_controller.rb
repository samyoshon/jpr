class SubscriptionsController < ApplicationController

	before_action :authenticate_user!, except: [:new]
	before_action :redirect_to_signup, only: [:new]

	def show
	end

	def new
	end

	def create
		customer = 	if current_user.stripe_id?
						Stripe::Customer.retrieve(current_user.stripe_id)
					else
						Stripe::Customer.create(email: current_user.email)
					end

		charge = customer.charge.create(
				amount: 10000,
				currency: "usd",
				source: params[:stripeToken],
				description: "Charge for one-time post"
		)

		current_user.update(
			stripe_id: customer.id,
			card_last4: params[:card_last4],
			card_exp_month: params[:card_exp_month],
			card_exp_year: params[:card_exp_year],
			card_brand: params[:card_brand]
		)

		redirect_to root_pathstc

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
