class CreateEstadosTratamientos < ActiveRecord::Migration
  def self.up
    create_table :estados_tratamientos do |t|
      t.string :nombre, :limit=> 100

      t.timestamps
    end
    EstadoTratamiento.create :nombre=> 'a realizar'
    EstadoTratamiento.create :nombre=> 'en proceso'
    EstadoTratamiento.create :nombre=> 'en espera de verificacion'
    EstadoTratamiento.create :nombre=> 'Finalizado'
  end

  def self.down
     drop_table :estados_tratamientos
  end
end
