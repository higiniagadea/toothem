class CreateObrasSociales < ActiveRecord::Migration
  def self.up
    create_table "obras_sociales" do |t|
        t.column :nombre, :string, :limit => 30
        t.column :domicilio, :string,:limit => 30
        t.column :telefono, :string, :limit => 30
        t.column :codigos_por_mes, :integer
        t.column :correo_electronico; :string, :limit => 255, :null => false 
        t.column :deleted_at, :date, :null => true

    end
  end

  def self.down
    drop_table "obras_sociales"
  end
end
