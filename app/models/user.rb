class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_one :basic , dependent: :destroy

   has_many :educations ,  dependent: :destroy
   		 accepts_nested_attributes_for :educations, reject_if: proc { |attributes| attributes['degree'].blank? } , allow_destroy: true

  
	  
end
