class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
    t.string :from 
    t.string :to 
    t.string :amount 
    t.string :result 
    end
  end
end
