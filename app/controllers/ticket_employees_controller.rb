class TicketEmployeesController < ApplicationController 
   def create 
      ticket = Ticket.find_by(params[:ticket_id]) #unsure about moving beyond here
   end
end