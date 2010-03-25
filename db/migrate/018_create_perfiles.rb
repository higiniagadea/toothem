class CreatePerfiles < ActiveRecord::Migration
  def self.up
    create_table "perfiles" do |t|
      t.column :nombre, :string
      t.column :estatico, :boolean
    end

    #Join table (items)
    create_table "permisos" do |t|
      t.column :perfil_id, :integer
      t.column :item_id, :integer
      t.column :crear_editar, :boolean
      t.column :ver, :boolean
      t.column :borrar, :boolean
    end

    add_index "permisos", "perfil_id"
    add_index "permisos", "item_id"




  end

  def self.down
    drop_table "perfiles"
    drop_table "permisos"
    
  end
end
