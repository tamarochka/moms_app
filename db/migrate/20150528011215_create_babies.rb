class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :first_name, null:false
      t.integer :age, null:false
      t.timestamps
    end
  end
end
