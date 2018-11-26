class ComplaintsController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:create]

	def index
		@complaints = Complaint.all
		@users = User.all
	end

	def new
		@users = User.all
		@complaint = Complaint.new
	end

	def show
		@complaint = Complaint.find(params[:id])
		@users=User.all
	end

	def create
		complaint= current_user.complaints.new(get_params)


		# NUMBER PLATE RECOGNIZER
			# url = URI.parse('https://platerecognizer.com/plate-reader/')
			# path = complaint.avatar.current_path
			# # path = "https://4.imimg.com/data4/PO/JU/ANDROID-4450666/product-500x500.jpeg"
	

			# File.open(path) do |jpg|
			#   req = Net::HTTP::Post::Multipart.new url.path,
			#     "upload" => UploadIO.new(jpg, "image/jpeg", path)

			#   req['Authorization'] = '640a016c82e33e4f0268b1e7d55ba9664717b68d'
			#   res = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
			#     http.request(req)
			#   end
			#   byebug
			# end
			   


		# Checks offence and assign fine
		if (get_params[:offence] == "1") 
		    offence = "Double Parking with no passenger inside the car"
		    fine_amount = 100
		 elsif (get_params[:offence] == "2") 
		    offence = "Not parking entirely inside the box"
		    fine_amount = 30
		 elsif (get_params[:offence] == "3") 
		    offence = "Parking in OKU without valid disabled permit"
		    fine_amount = 200
		 elsif (get_params[:offence] == "4") 
		    offence = "Parking at a bus station or a bus stand"
		    fine_amount = 100
		 elsif (get_params[:offence] == "5") 
		    offence = "Parking on a yellow/white line"
		    fine_amount = 80
		 elsif (get_params[:offence] == "6") 
		    offence = "Parking somewhere which obstructs traffic"
		    fine_amount = 250
		 else
		     offence = "nil"
		     fine_amount = nil
		 end

		complaint.update(offence:offence)
		complaint.update(fine_amount:fine_amount)

		# Get location and assign address
		if Geocoder.search([get_params[:latitude],get_params[:longitude]]) !=nil
			address_object = Geocoder.search([get_params[:latitude],get_params[:longitude]])
			address = address_object.first.address
			postal_code=address_object.first.postal_code
			# Assign into complaint object
			complaint.update(address:address)
			complaint.update(postal_code:postal_code)
		end

		# Find offender thru number plate
		offender= User.find_by(number_plate:get_params[:number_plate])
		# Assign offender user_id to offender_id
		complaint.update(offender_id:offender.id)
		
		if complaint.save
			redirect_to root_path
		else
			render 'new'
		end

	end

	# Ajax for Carousel Approve/Reject on Officer Show Page's Carousel Cards
	def carousel_approve
		@complaint_status = Complaint.find(get_params[:complaint_id])
		@complaint_status.status = 1
		@complaint_status.save
	def complaint_history
		@complaints=Complaint.all
		@users=User.all
	end


private

		@next_index = params[:index].to_i + 1
		@index = params[:index].to_i

		@complaints = Complaint.where(status: "0")

		@complaint = Complaint.find(get_params[:complaint_id])
		fine = Fine.create_from_complaint(@complaint, current_officer)
		fine.save

		render partial: '/officers/carousel_approve'
	end
 
	def carousel_reject
		@complaint_status = Complaint.find(get_params[:complaint_id])
		@complaint_status.status = 2
		@complaint_status.save

		@next_index = params[:index].to_i + 1
		@index = params[:index].to_i

		@complaints = Complaint.where(status: "0")
		render partial: '/officers/carousel_reject'
	end	

	def reject
		@complaint = Complaint.find(get_params[:complaint_id])
		@complaint.status = 2
		
		if @complaint.save
				redirect_to officer_path(current_officer)
		else
				redirect_to complaint_path(@complaint.id)
		end
	end
	
	private

	def get_params
		params.permit(
				:latitude,
				:longitude,
				:img,
				:comment,
				:avatar,
				:number_plate,
				:offence,
				:status,
				:complaint_id
			)
	end
end
