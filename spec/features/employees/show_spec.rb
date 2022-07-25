# Story 2
# Employee Show

# As a user,
# When I visit the Employee show page,
# I see the employee's name, department

# and a list of all of their tickets from oldest to youngest.
# I also see the oldest ticket assigned to the employee listed separately

require 'rails_helper' 
RSpec.describe 'Employee show page' do 
   it 'has the employee name and department' do 
      department_1 = Department.create!(name: "Sales", floor: 2)
      department_2 = Department.create!(name: "Inventory", floor: 1)
      department_3 = Department.create!(name: "Returns", floor: 3)

      employee_1 = department_1.employees.create!(name: "Susan", level: 5)
      employee_2 = department_2.employees.create!(name: "Rohan", level: 2)
      employee_3 = department_3.employees.create!(name: "Lola", level: 4)

      # save_and_open_page 

      visit "/employees/#{employee_1.id}" 

      expect(page).to have_content("Susan")
      expect(page).to have_content("Sales")
      expect(page).to_not have_content("Returns")
   end

   it 'has a list of all employees tickets from youngest to oldest' do 
      department_1 = Department.create!(name: "Sales", floor: 2)
      department_2 = Department.create!(name: "Inventory", floor: 1)
      department_3 = Department.create!(name: "Returns", floor: 3)

      employee_1 = department_1.employees.create!(name: "Susan", level: 5)
      employee_2 = department_2.employees.create!(name: "Rohan", level: 2)
      employee_3 = department_3.employees.create!(name: "Lola", level: 4)

      ticket_1 = employee_1.tickets.create!(subject: "IT", age: 2)
      ticket_2 = employee_1.tickets.create!(subject: "Customer complaint", age: 3)

      visit "/employees/#{employee_1.id}" 

      expect(page).to have_content("age: 2")
   end

   it 'has oldest ticket of employee' do 
      department_1 = Department.create!(name: "Sales", floor: 2)
      department_2 = Department.create!(name: "Inventory", floor: 1)
      department_3 = Department.create!(name: "Returns", floor: 3)

      employee_1 = department_1.employees.create!(name: "Susan", level: 5)
      employee_2 = department_2.employees.create!(name: "Rohan", level: 2)
      employee_3 = department_3.employees.create!(name: "Lola", level: 4)

      ticket_1 = employee_1.tickets.create!(subject: "IT", age: 2)
      ticket_2 = employee_1.tickets.create!(subject: "Customer complaint", age: 3)
      ticket_3 = employee_1.tickets.create!(subject: "Help", age: 1)

      visit "/employees/#{employee_1.id}" 

      expect(page).to have_content("Oldest age: 3")
   end
end
