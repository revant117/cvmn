class Project < ActiveRecord::Base
	validates :proj_name , presence: true
end

