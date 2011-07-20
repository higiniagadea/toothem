class CreateSaldosPacientes <  ActiveRecord::Migration
  def self.up
    create_table "saldos_pacientes" do |t|
       t.column :monto, :float
       t.column :periodo_id, :integer
       t.column :paciente_id, :integer

      t.timestamps
    end


  end

  def self.down
    drop_table "saldos_pacientes"
  end
end
