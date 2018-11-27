class Complaint < ApplicationRecord
	
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	has_one :fine
	enum status: {Pending: 0, Approved: 1, Rejected: 2}
end
