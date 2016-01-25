class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_one :basic , dependent: :destroy

	  accepts_nested_attributes_for :basic, reject_if: proc { |attributes| attributes['full_name', 'email'].blank? } , :allow_destroy => true  
  
	  
end
