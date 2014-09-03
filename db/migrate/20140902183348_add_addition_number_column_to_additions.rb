class AddAdditionNumberColumnToAdditions < ActiveRecord::Migration
  def change
    add_column :additions, :addition_number, :integer
  end
end
