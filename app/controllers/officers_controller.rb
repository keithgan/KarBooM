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

    end
    # Officer Request for Change from Super Admin Page
    def edit
    end

    def update
    end

    def destroy
    end
end