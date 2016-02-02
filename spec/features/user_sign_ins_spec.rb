require 'rails_helper'
require 'support/features'

#using databse cleaner
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

RSpec.feature "UserSignIns", type: :feature, js: true  do


   scenario "User Sign up first time" do

   		# o = ('a'..'z').to_a.shuffle[0,8].join to make a random string
  	
	    visit "/users/sign_up"

	    fill_in "user_name", :with => "c"
	    fill_in "user_email", :with =>"a@a.com"
	    fill_in "user_password" ,:with => '12121212'
	    fill_in 'user_password_confirmation' ,:with => '12121212'
	    # click_button "user_sign_in"
	    # submit_form
	     find('input[name="commit"]').click

	    expect(page).to have_text("dashboard")
	end


	# scenario "User Sign up same mail" do
	# 	visit "/users/sign_up"

	#     fill_in "user_name", :with => "c"
	#     fill_in "user_email", :with => "a@a.com"
	#     fill_in "user_password" ,:with => '12121212'
	#     fill_in 'user_password_confirmation' ,:with => '12121212'
	#     # click_button "user_sign_in"
	#     # submit_form
	#      find('input[name="commit"]').click

	#     expect(page).to have_text("has already been taken")
	# end

	scenario "user signs in with wrong email" do
    	user_sign_in_with "a" , "12121212"

    	expect(page).to have_text("Log in")
    end

    scenario "user signs in with wrong password" do
    	user_sign_in_with "a@a.com" , "1212121"

    	expect(page).to have_text("Log in")
    end

    scenario "user signs in with right credentials" do
    	user_sign_in_with "a@a.com" , "12121212"

    	expect(page).to have_text("dashboard")
    end

	

end

 