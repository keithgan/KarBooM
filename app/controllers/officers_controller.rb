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
        @complaints = Complaint.where(status: "0")
        @appeals = Fine.where(status: "2")
        @fines = Fine.all
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
		@appeals = Fine.where(status: "2")
		render partial: '/officers/appeals_tab'
    end

    def fines_tab
		@fines = Fine.all
		render partial: '/officers/fines_tab'
	end

end