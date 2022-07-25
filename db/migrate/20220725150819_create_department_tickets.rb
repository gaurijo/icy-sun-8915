class CreateDepartmentTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :department_tickets do |t|
      t.references :department, foreign_key: true
      t.references :ticket, foreign_key: true
    end
  end
end
