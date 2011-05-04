class CreatePagosObrasSociales <  ActiveRecord::Migration
  def self.up
    create_table "pagos_obras_sociales" do |t|

       t.column :monto, :float
       t.column :nro_recibo, :integer
       t.column :fecha, :date
       t.column :fue_liquidado, :boolean
       t.column :fecha_liquidacion, :date
       t.column :obra_social_id, :integer

      t.timestamps
    end

  end

  def self.down
    drop_table "pagos_obras_sociales"
  end
end
