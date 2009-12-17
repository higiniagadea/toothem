class CreatePerfiles < ActiveRecord::Migration
  def self.up
    create_table "perfiles" do |t|
      t.column :nombre, :string
    end

    #Join table (items)
    create_table "perfiles_items" do |t|
      t.column :perfil_id, :integer
      t.column :item_id, :integer
    end

    add_index "perfiles_items", "perfil_id"
    add_index "perfiles_items", "item_id"




  end

  def self.down
    drop_table "perfiles"
    drop_table "perfiles_items"
    
  end
end
