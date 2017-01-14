class OrganizationsProvince < ActiveRecord::Base
	belongs_to :organization
	belongs_to :province
end
