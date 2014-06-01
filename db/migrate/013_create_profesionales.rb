class CreateProfesionales < ActiveRecord::Migration
  def self.up
    create_table "profesionales" do |t|

      t.column :nombre, :string
      t.column :tipo_documento_id, :integer
      t.column :nro_documento, :integer
      t.column :email, :string
      t.column :matricula_profesional, :string
      t.column :direccion, :string
      t.column :telefono, :string
      t.column :movil, :string
      t.column :fecha_nacimiento, :date
      t.column :fecha_ingreso, :date
      t.column :estado_laboral_id, :integer
    
 t.column :deleted_at, :date, :null => true
    end
     
  end

  def self.down
    drop_table "profesionales"
  end
end
