class RemoveAdditionsColumnFromStarts < ActiveRecord::Migration
  def change
    remove_column :starts, :additions
  end
end
