class FinesController < ApplicationController

    def index
        @fines = Fine.all
    end

    def show
        @fine = Fine.find(params[:id])
    end

    def create
        @complaint = Complaint.find(params[:complaint_id])
        @fine = Fine.create_from_complaint(@complaint, current_officer)
        if @fine.save
            redirect_to officer_path(current_officer)
        else
            redirect_to complaint_path(@complaint.id)
        end
    end

    def appeal
        @fine = Fine.find(params[:id])
        @fine.status = 2

        if @fine.save
            redirect_to all_fines_path
        end
    end

    def my_fines
        @fines = current_user.fines
    end
   
    private

    def fine_params
        params.require(:fine).permit(
            :date,
            :time,
            :location,
            :offence,
            :amount,
            :status
        )
    end
end
