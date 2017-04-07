class Myth < ActiveRecord::Base
	has_many :mythsUsers
	has_many :users, through: :mythsUsers
	mount_uploader :myth_pic, MythpicUploader
end
