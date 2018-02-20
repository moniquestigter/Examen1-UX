class LocationsController < ApplicationController
	before_action :authenticate_user!
	def index
		@locations = Location.all.order('Created_at DESC')
	end
	def new

	end

	def create
	end 

	def show
	end

end
