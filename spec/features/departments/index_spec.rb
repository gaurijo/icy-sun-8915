# Story 1
# Department Index

# As a user,
# When I visit the Department index page,
# I see each department's name and floor
# And underneath each department, I can see the names of all of its employees

require 'rails_helper'

RSpec.describe 'Department index page' do 
   it 'has each department name and floor' do 
      department_1 = Department.create!(name: "Sales", floor: 2)
      department_2 = Department.create!(name: "Inventory", floor: 1)
      department_3 = Department.create!(name: "Returns", floor: 3)

      visit '/departments'

      expect(page).to have_content("Sales")
      expect(page).to have_content("Inventory")
      expect(page).to have_content("Returns")

      expect(page).to have_content("2")
      expect(page).to have_content("1")
      expect(page).to have_content("3")
      expect(page).to_not have_content("4")
   end

   it 'has names of departments employees underneath department' do 
      department_1 = Department.create!(name: "Sales", floor: 2)
      department_2 = Department.create!(name: "Inventory", floor: 1)
      department_3 = Department.create!(name: "Returns", floor: 3)

      employee_1 = department_1.employees.create!(name: "Susan", level: 5)
      employee_2 = department_2.employees.create!(name: "Rohan", level: 2)
      employee_3 = department_3.employees.create!(name: "Lola", level: 4)

      visit '/departments'

      within "#department-#{department_1.id}" do 
         expect(page).to have_content("Susan")
      end

      within "#department-#{department_2.id}" do 
         expect(page).to have_content("Rohan")
      end

      within "#department-#{department_3.id}" do 
         expect(page).to have_content("Lola")
      end
   end
end
      