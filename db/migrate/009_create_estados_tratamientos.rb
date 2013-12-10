class CreateEstadosTratamientos < ActiveRecord::Migration
  def self.up
    create_table :estados_tratamientos do |t|
      t.string :nombre, :limit=> 100

      t.timestamps
    end
   
    EstadoTratamiento.create :nombre=> 'A realizar'
     EstadoTratamiento.create :nombre=> 'A autorizar por Obra Social'
    EstadoTratamiento.create :nombre=> 'En proceso'
    EstadoTratamiento.create :nombre=> 'En espera de verificacion'
    EstadoTratamiento.create :nombre=> 'Finalizado'
  end

  def self.down
     drop_table :estados_tratamientos
  end
end
