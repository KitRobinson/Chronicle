class Association < ActiveRecord::Base
	belongs_to :actor
	belongs_to :domain
end
