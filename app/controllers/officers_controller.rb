class OfficersController < ApplicationController
    # List of All Officers/Officer Directory by Super Admin
    def index
        @officers = Officer.order(:full_name).page params[:page]
    end
    # Create Page for New Officer by Super Admin
    def new
    end

    def create
        redirect_to new_officer_registration_path
    end
    # Officer Profile Page
    def show
        @officer = Officer.find(params[:id])
        @complaints = Complaint.where(status: "0")
    end
    # Officer Request for Change from Super Admin Page
    def edit
    end

    def update
    end

    def destroy
    end

    def complaints_tab
		@complaints = Complaint.where(status: "0")
		render partial: '/officers/complaints_tab'
	end

	def appeals_tab
		@complaints = Complaint.where(status: "0")
		render partial: '/officers/appeals_tab'
    end
    
    def carousel_approve
        x
    end

    def carousel_reject
        x
    end
end