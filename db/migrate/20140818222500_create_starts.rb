class CreateStarts < ActiveRecord::Migration
  def change
    create_table :starts do |t|
      t.integer :user_id
      t.string :title
      t.text :story_text
      t.datetime :date
      t.integer :additions, default: 0
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
