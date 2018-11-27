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
        @complaints = Complaint.where(status:"0", postal_code: current_officer.officer_locality)
        @appeals = Fine.where(status: "2", officer_id: current_officer.id)
        @fines = Fine.where(officer_id: current_officer.id)
    end
    # Officer Request for Change from Super Admin Page
    def edit
    end

    def update
    end

    def destroy
    end

    def complaints_tab
		@complaints = Complaint.where(status:"0", postal_code: current_officer.officer_locality)
		render partial: '/officers/complaints_tab'
	end

	def appeals_tab
		@appeals = Fine.where(status: "2", officer_id: current_officer.id)
		render partial: '/officers/appeals_tab'
    end

    def fines_tab
		@fines = Fine.where(officer_id: current_officer.id)
		render partial: '/officers/fines_tab'
	end

end