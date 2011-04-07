class CreateSaldosObrasSociales <  ActiveRecord::Migration
  def self.up
    create_table "saldos_obras_sociales" do |t|
       t.column :periodo_id, :integer
       t.column :monto, :float
       t.column :obra_social_id, :integer


      t.timestamps
    end

  end

  def self.down
    drop_table "saldos_obras_sociales"
  end
end
