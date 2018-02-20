class RecordingsController < ApplicationController
	before_action :authenticate_user! , except: [:index, :show]

	def create
		@location = Location.find(params[:location_id])
		@recording = @location.recordings.create(recording_param)
		@recording.user_id = current_user.id if current_user
		@recording.save

		redirect_to location_path(@location)
	end

	def update
		@location = Location.find(params[:id])
		@recording = @location.recordings.find(params[:id])

		@recording.update_attributes(recording_param)
    	if @recording.save
        	redirect_to @location
    	else
        	render 'edit'
    	end
	end

	def edit
    	@location = Location.find(params[:id])
    	@recording = @location.recordings.find(params[:id])
	end

	def destroy
		@location = Location.find(params[:id])

		@recording = @location.recordings.find(params[:id])
		@recording.destory

		redirect_to location_path(@location)
	end

	private
	def recording_param
		params.require(:recording).permit(:user_id, :temp, :status)
	end
end
