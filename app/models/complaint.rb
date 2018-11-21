class Complaint < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
end
