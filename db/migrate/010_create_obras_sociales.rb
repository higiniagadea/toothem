class CreateObrasSociales < ActiveRecord::Migration
  def self.up
    create_table "obras_sociales" do |t|
        t.column :nombre, :character, :limit => 30
        t.column :domicilio, :character,
        t.column :telefono, :character, 
        t.column :codigos_por_mes, :integer
        t.column :correo_electronico; :character     
        t.column :deleted_at, :date

    end
  end

  def self.down
    drop_table "obras_sociales"
  end
end
