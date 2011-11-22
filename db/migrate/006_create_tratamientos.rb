 class CreateTratamientos < ActiveRecord::Migration
  def self.up
    create_table "tratamientos" do |t|
      t.column :fecha, :date
      t.column :diente, :integer, :limit => 2
      t.column :cara, :integer, :limit => 2
      t.column :fecha_finalizacion, :date
      t.column :importe_cubierto, :float
      t.column :coseguro, :float
      t.column :fue_liquidado, :boolean
      t.column :fecha_liquidacion, :date
      t.column :observaciones, :string


      t.column :odontograma_id, :integer
      t.column :paciente_id, :integer
      t.column :prestacion_id, :integer
   
      t.column :profesional_id, :integer
      t.column :obra_social_id, :integer
      t.column :estado_tratamiento_id, :integer
      t.column :ficha_id, :integer
      t.column :deleted_at, :date


    end
  end

  def self.down
    drop_table "tratamientos"
  end
end
