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

		if (get_params[:offence] == "1") 
		    offence = "Double Parking with no passenger inside the car"
		    fine = 100
		 elsif (get_params[:offence] == "2") 
		    offence = "Not parking entirely inside the box"
		    fine = 30
		 elsif (get_params[:offence] == "3") 
		    offence = "Parking in OKU without valid disabled permit"
		    fine = 200
		 elsif (get_params[:offence] == "4") 
		    offence = "Parking at a bus station or a bus stand"
		    fine = 100
		 elsif (get_params[:offence] == "5") 
		    offence = "Parking on a yellow/white line"
		    fine = 80
		 elsif (get_params[:offence] == "6") 
		    offence = "Parking somewhere which obstructs traffic"
		    fine = 250
		 else
		     offence = "nil"
		     fine = nil
		 end

		complaint.update(offence:offence)
		complaint.update(fine:fine)
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
