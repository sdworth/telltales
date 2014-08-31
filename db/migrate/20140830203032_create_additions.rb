class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.integer :start_id
      t.integer :user_id
      t.text :addition_text

      t.timestamps
    end
  end
end
