class TicketEmployeesController < ApplicationController 
   def create 
      employee = Employee.find(params[:employee_id]) #this picks out the employee by id 
      ticket = Ticket.find_by(ticket_id: params[:ticket_id]) #this finds the ticket by the ticket id 
      TicketEmployee.create!(employee_id: employee.id, ticket_id: ticket.id) #this creates a new ticketemployee

      redirect_to "/employees/#{employee.id}" #redirects to the original employee that was picked out by the id on line 3
   end
end

#got stuck at this part