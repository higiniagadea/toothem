class CreatePagosPacientes <  ActiveRecord::Migration
  def self.up
    create_table "pagos_pacientes" do |t|
       t.column :fecha, :date
       t.column :monto, :float
       t.column :nro_recibo, :string, :limit => 255
       t.column :fue_liquidado, :boolean
       t.column :paciente_id, :integer
       t.column :fecha_liquidacion,   
       t.column :deleted_at, :date

      t.timestamps
    end





  end

  def self.down
    drop_table "pagos_pacientes"
  end
end