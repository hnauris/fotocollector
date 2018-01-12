class ChangeIntegerByteSize < ActiveRecord::Migration[5.1]
  def change
    change_column :kameras, :eksempsk, :integer, limit: 8
    change_column :kameras, :cena, :integer, limit: 8
    change_column :kameras, :vertejums, :integer, limit: 8
  end
end
