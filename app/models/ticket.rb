class Ticket < ApplicationRecord 
   has_many :ticket_employees
   has_many :employees, through: :ticket_employees 

   def self.order_by_age
      order(age: :desc)
   end

   def self.oldest 
      maximum(:age)
   end
end