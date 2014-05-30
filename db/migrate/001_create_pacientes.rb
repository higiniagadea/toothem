class CreatePacientes < ActiveRecord::Migration
  def self.up
    create_table "pacientes" do |t|

      t.column :nombre, :string, :limit => 255, :null => false

      t.column :tipo_documento_id, :integer

      t.column :nro_documento, :string, :limit => 50, :null => false
      t.column :sexo, :string, :limit => 255, :null => false
      t.column :estado_civil, :string, :limit => 100, :null => true
      t.column :domicilio_particular, :string, :limit => 255, :null => false
      t.column :domicilio_laboral, :string, :limit => 255, :null => true
      t.column :fecha_nacimiento, :date, :null => true

      t.column :grupo_sanguineo, :string, :limit => 255

      t.column :telefono_particular, :string, :limit => 255, :null => true
      t.column :telefono_laboral, :string, :limit => 255, :null => true
      t.column :movil, :string, :limit => 100, :null => true
      t.column :profesion, :string, :limit => 150, :null => true
      t.column :ocupacion, :string, :limit => 150, :null => true
      t.column :nivel_escolar, :string, :limit => 150, :null => true
      t.column :nro_afiliado, :string, :limit => 150, :null => true
      t.column :deleted_at, :date, :null => true
      
      


      
      # FKs
    
      t.column :archivo_id, :integer, :null => true # Imagen o foto del paciente
      t.column :consultorio_id, :integer, :null => true
      t.column :titular_id, :integer, :null => true
      t.column :localidad_id, :integer, :null => true

      t.timestamps

      
      # Indices
      #add_index :pacientes, :nombre
      #add_index :pacientes, :matricula

      #add_index :pacientes, :archivo_id
      #add_index :pacientes, :consultorio_id
      #add_index :pacientes, :titular_id
      #add_index :pacientes, :localidad_id
      #add_index :pacientes, :nro_afiliado


      




    end
  end

  def self.down
    drop_table "pacientes"
  end
end
