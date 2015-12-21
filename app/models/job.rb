class Job < ActiveRecord::Base

	belongs_to :user

	attr_accessor :country_code

	def country_name
	    country = ISO3166::Country[country_code]
	    country.translations[I18n.locale.to_s] || country.name
 	end
end
