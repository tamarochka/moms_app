class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :hr_base, null: false
      t.integer :hr_qty, null: false
      t.string :notes


      t.timestamps null: false
    end
  end
end
