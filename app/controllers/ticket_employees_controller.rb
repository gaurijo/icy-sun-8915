class TicketEmployeesController < ApplicationController 
   def create 
      ticket = Ticket.find(params[:id])
      employee = Employee.find(params[:employee_id])
      TicketEmployee.create!(employee: employee, ticket: ticket) #this creates a new ticketemployee
      # require 'pry'; binding.pry 
      redirect_to "/employees/#{employee.id}" 
      #redirects to the original employee that was picked out by the id on line 3
   end
end

#got stuck at this part