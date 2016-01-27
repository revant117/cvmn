class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_one :basic , dependent: :destroy


   has_many :educations ,  dependent: :destroy
   		 accepts_nested_attributes_for :educations, reject_if: proc { |attributes| attributes['degree'].blank? } , allow_destroy: true

   	has_many :projects ,  dependent: :destroy
   		 accepts_nested_attributes_for :projects, reject_if: proc { |attributes| attributes['proj_name'].blank? } , allow_destroy: true


    has_many :exps ,  dependent: :destroy
       accepts_nested_attributes_for :exps, reject_if: proc { |attributes| attributes['comp_name'].blank? } , allow_destroy: true

    has_many :skills ,  dependent: :destroy
       accepts_nested_attributes_for :skills, reject_if: proc { |attributes| attributes['skill_name'].blank? } , allow_destroy: true

  	
end
