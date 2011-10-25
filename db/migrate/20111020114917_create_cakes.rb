class CreateCakes < ActiveRecord::Migration
  def self.up
    create_table :cakes do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :cake_photos do |t|
      t.string :photo_file_name, :string # Original filename
      t.string :photo_content_type, :string # Mime type
      t.integer :photo_file_size, :integer # File size in
      t.integer :cake_id
      t.timestamps
    end
  end

  def self.down
    drop_table :cakes
    drop_table :cake_photos
  end
end