class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :first_name, null:false
      t.date :dob, null:false
      t.integer :user_id
      t.timestamps
    end
  end
end
