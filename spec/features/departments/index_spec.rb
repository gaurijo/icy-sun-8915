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
end
      