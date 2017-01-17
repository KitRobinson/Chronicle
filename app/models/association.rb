class Association < ActiveRecord::Base
	belongs_to :associable, polymorphic: true
	belongs_to :domain
end
