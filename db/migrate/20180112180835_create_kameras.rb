class CreateKameras < ActiveRecord::Migration[5.1]
  def change
    create_table :kameras do |t|
      t.belongs_to :user, index:true
      t.string :modelis
      t.string :razotajs
      t.string :serijasnr
      t.string :valsts
      t.integer :eksempsk
      t.integer :cena
      t.string :papildinformacija
      t.integer :vertejums
      t.timestamps
    end
    add_index :kameras, :modelis
  end
end
