class Fine < ApplicationRecord
    belongs_to :user
    belongs_to :complaint
    belongs_to :officer
    enum status: { unpaid: 0, paid: 1, appealed: 2 }

    def self.create_from_complaint(complaint, officer)
        fine = Fine.new
        fine.date = complaint.created_at.strftime("%d/%m/%Y")
        fine.time = complaint.created_at.strftime("%H:%M:%S")
        fine.location = complaint.address 
        fine.offence = complaint.offence 
        fine.amount = complaint.fine_amount
        fine.complaint_id = complaint.id
        fine.set_recipients(complaint, officer)
        return fine
    end

    def set_recipients(complaint, officer)
        # set id of user who received the fine
        self.user_id = User.find_by(number_plate: complaint.number_plate).id
        # set id of officer who gave the fine
        self.officer_id = officer.id
    end
end
