class FinesController < ApplicationController

    def show
        @complaint = Complaint.find_by(id:params[:format])
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
