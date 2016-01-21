class RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
		edit_user_registration_path
  	end

  private

	def update_resource(resource, params)
    	resource.update_without_password(params)
  	end

  	def registration_params
  		params.require(:user).permit(:email, :password, :password_confirmation, :name, :description, :facebook, :website, :question_one, :question_two, :question_three, :question_four, :question_five, :answer_one, :answer_two, :answer_three, :answer_four, :answer_five, :logo)
	end

end
