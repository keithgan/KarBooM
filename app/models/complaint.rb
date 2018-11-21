class Complaint < ApplicationRecord
	# For carrierwave image uploader
	mount_uploader :avatar, AvatarUploader
end
