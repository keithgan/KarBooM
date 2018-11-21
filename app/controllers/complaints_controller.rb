class ComplaintsController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:create]


	def index
		@complaints=Complaint.all
	end

	def new
		@complaint= Complaint.new
	end

	def show
		@complaint = Complaint.find_by(id:params[:format])
	end

	def create
		complaint= current_user.complaints.new(get_params)
		if complaint.save
			redirect_to root_path
		else
			render 'new'
		end
	
	end

private

def get_params
	params.permit(:latitude,:longitude,:img,:comment,:avatar,:number_plate,:offence)
end
end
