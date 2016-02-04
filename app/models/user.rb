class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable, :omniauth_providers => [:google_oauth2]
  # devise :omniauthable, :omniauth_providers => [:google_oauth2]
         
   has_one :basic , dependent: :destroy


   has_many :educations ,  dependent: :destroy
   		 accepts_nested_attributes_for :educations, reject_if: proc { |attributes| attributes['degree'].blank? } , allow_destroy: true

   	has_many :projects ,  dependent: :destroy
   		 accepts_nested_attributes_for :projects, allow_destroy: true
# , reject_if: proc { |attributes| attributes['proj_name'].blank? } ,

    has_many :exps ,  dependent: :destroy
       accepts_nested_attributes_for :exps, reject_if: proc { |attributes| attributes['comp_name'].blank? } , allow_destroy: true

    has_many :skills ,  dependent: :destroy
       accepts_nested_attributes_for :skills, reject_if: proc { |attributes| attributes['skill_name'].blank? } , allow_destroy: true

       def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(:email => data["email"]).first

          # Uncomment the section below if you want users to be created if they don't exist
          unless user
              user = User.create(name: data["name"],
                 email: data["email"],
                 password: Devise.friendly_token[0,20]
              )
          end
          user
      end

  	
end
