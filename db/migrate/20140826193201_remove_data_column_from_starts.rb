class RemoveDataColumnFromStarts < ActiveRecord::Migration
  def change
    remove_column :starts, :date
  end
end
