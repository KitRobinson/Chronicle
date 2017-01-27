class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :reference, class_name: "Post"
	has_many :responses, class_name: "Post", foreign_key: :reference_id

	def response_ct_survey
		rcount = 1
		responses.each { |resp| rcount += resp.response_ct_survey} 
		return rcount
	end

	def response_dt_survey
		lresp = self.created_at
		responses.each do |resp| 
			n = resp.response_dt_survey
			lresp = lresp > n ? lresp : n
		end
		return lresp
	end

end
