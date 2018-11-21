class ComplaintsController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:create]


	def index
		@complaints=Complaint.all
	end

	def new
		@complaint= Complaint.new
	end

	def show

	end

	def create

		complaint= Complaint.new(get_params)
		if complaint.save
			redirect_to root_path
		else
			render 'new'
		end
	
	end

private

def get_params
	params.permit(:latitude,:longitude,:img,:comment,:avatar)
end
end
