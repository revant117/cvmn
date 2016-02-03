    def user_sign_in_with(email , password)
        visit "/users/sign_in"
        fill_in "user_email", :with => email
        fill_in "user_password" ,:with => password
        find('input[name="commit"]').click
        

    end


    def user_adds_projects(projects)
    # click_link "Education"
      find('a[id="project"]').click
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content "add projects"

      projects.count.times do |x|
        click_link "add projects"
      

        find("input[id$=_proj_name]", match: :first)
        all("input[id$=_proj_name").last.set(projects[x].proj_name)
        
        all("[id$=_proj_des]").last.set(projects[x].proj_des)
        
        all("[id$=_proj_add]").last.set(projects[x].proj_add)
     
      end
      find('input[name="commit"]').click
      expect(page).to have_content "dashboard"
    end

