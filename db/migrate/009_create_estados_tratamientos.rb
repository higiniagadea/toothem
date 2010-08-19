class CreateEstadosTratamientos < ActiveRecord::Migration
  def self.up
    create_table :estados_tratamientos do |t|
      t.string :nombre, :limit=> 100

      t.timestamps
    end
    EstadoTratamiento.create :nombre=> 'comenzado'
    EstadoTratamiento.create :nombre=> 'terminado'
  end

  def self.down
     drop_table :estados_tratamientos
  end
end
