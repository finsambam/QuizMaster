class Quiz < ApplicationRecord
	validates :email, presence: true
	
	default_scope { where("submit_time IS NULL") }	
end
