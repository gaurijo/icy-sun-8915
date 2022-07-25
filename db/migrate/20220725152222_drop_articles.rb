class DropArticles < ActiveRecord::Migration[5.2]
  def change
    drop_table :department_tickets
  end
end
