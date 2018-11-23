class Fine < ApplicationRecord
    belongs_to :user
    enum status: { unpaid: 0, paid: 1, appealed: 2 }

    def self.create_from_complaint(complaint, officer)
        fine = Fine.new
        fine.date = Time.now.strftime("%d/%m/%Y")
        fine.time = Time.now.strftime("%H:%M:%S")
        fine.location = complaint.address 
        fine.offence = complaint.offence 
        fine.amount = complaint.fine
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
