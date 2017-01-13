class Actor < ActiveRecord::Base
	belongs_to :race
	belongs_to :province
	belongs_to :organization
	has_many :associations, as: :associable
	has_many :artifacts, foreign_key: :owner
	has_many :domains, through: :associations

	#validates :name, :race_id, :scale, :count, presence: true
end
