require 'rails_helper'

RSpec.describe Ticket, type: :model do
   describe 'relationships' do
      it { should have_many(:employees).through(:ticket_employees)}
   end

   describe 'model methods' do 
      describe 'order youngest to oldest' do 
         it 'orders tickets youngest to oldest' do 
            department_1 = Department.create!(name: "Sales", floor: 2)
            department_2 = Department.create!(name: "Inventory", floor: 1)
            department_3 = Department.create!(name: "Returns", floor: 3)

            employee_1 = department_1.employees.create!(name: "Susan", level: 5)
            employee_2 = department_2.employees.create!(name: "Rohan", level: 2)
            employee_3 = department_3.employees.create!(name: "Lola", level: 4)

            ticket_1 = employee_1.tickets.create!(subject: "IT", age: 2)
            ticket_2 = employee_1.tickets.create!(subject: "Customer complaint", age: 3)
            ticket_3 = employee_1.tickets.create!(subject: "Help", age: 1)

            expect(Ticket.order_by_age).to eq([ticket_3, ticket_1, ticket_2])
         end
      end
   end
end