class AddAttachmentPhotoToKameras < ActiveRecord::Migration[5.1]
  def self.up
    change_table :kameras do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :kameras, :photo
  end
end
