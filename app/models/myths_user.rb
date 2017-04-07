class MythsUser < ActiveRecord::Base
	belongs_to :myth
	belongs_to :user
	mount_uploader :myth_pic, MythpicUploader

end
