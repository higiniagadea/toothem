class CreatePeriodos <  ActiveRecord::Migration
  def self.up
    create_table "periodos" do |t|
       t.column :mes, :date, :null => false
     
       t.column :fecha_liquidacion, :date
       t.column :fue_liquidado, :boolean, :null => false
       t.column :deleted_at, :date
      t.timestamps
    end

  end

  def self.down
    drop_table "periodos"
  end
end
