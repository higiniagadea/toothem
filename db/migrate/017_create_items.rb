class CreateItems < ActiveRecord::Migration
  def self.up
    create_table "items" do |t|
      
      t.column :nombre, :string
      t.column :url, :string
      t.column :metodo_http, :string
      t.column  :orden, :integer
      t.column :estatico, :boolean
      t.column :activo, :boolean, :default => true
      t.column :url_imagen, :string
      # Needed by acts_as_category
      t.integer :parent_id, :children_count, :ancestors_count, :descendants_count, :position
      t.boolean :hidden
    end
  end
  def self.down
    drop_table "items"
  end
end
