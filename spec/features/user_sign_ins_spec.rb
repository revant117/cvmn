require 'rails_helper'

RSpec.feature "UserSignIns", type: :feature  do
   scenario "User Sign up first time" do

   		o = ('a'..'z').to_a.shuffle[0,8].join
  	
	    visit "/users/sign_up"

	    fill_in "user_name", :with => "c"
	    fill_in "user_email", :with => o.to_s + "@a.com"
	    fill_in "user_password" ,:with => '12121212'
	    fill_in 'user_password_confirmation' ,:with => '12121212'
	    # click_button "user_sign_in"
	    # submit_form
	     find('input[name="commit"]').click

	    expect(page).to have_text("dashboard")
	end


	scenario "User Sign up same mail" do
		visit "/users/sign_up"

	    fill_in "user_name", :with => "c"
	    fill_in "user_email", :with => "c@a.com"
	    fill_in "user_password" ,:with => '12121212'
	    fill_in 'user_password_confirmation' ,:with => '12121212'
	    # click_button "user_sign_in"
	    # submit_form
	     find('input[name="commit"]').click

	    expect(page).to have_text("has already been taken")
	end


	scenario "User Sign In" do
	    visit "/users/sign_in"

	    # fill_in "user_name", :with => "aa@a.com"
	    fill_in "user_email", :with => "b@b.com"
	    fill_in "user_password" ,:with => '12121212'
	    # fill_in 'user_password_confirmation' ,:with => '12121212'
	    # click_button "user_sign_in"
	    # submit_form
	    find('input[name="commit"]').click

    	expect(page).to have_text("dashboard")
	end
end

 