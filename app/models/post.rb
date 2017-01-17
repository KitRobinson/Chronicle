class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :reference, class_name: "Post"
	has_many :responses, class_name: "Post", foreign_key: :reference_id
end
