class CreateEstadosLaborales < ActiveRecord::Migration
  def self.up
    create_table :estados_laborales do |t|
      t.string :descripcion, :limit=>100

      t.timestamps
    end
    EstadoLaboral.create :descripcion=>'ALTA'
    EstadoLaboral.create :descripcion=>'BAJA'
    EstadoLaboral.create :descripcion=>'LICENCIA'
  end

  def self.down
    drop_table :estados_laborales
  end
end
