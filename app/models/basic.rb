class Basic < ActiveRecord::Base
	validates :full_name , presence: true
	validates :phone , format: {:with => /\A\d{10}\Z/ , message: 'must be number and 10 digits'}
end
