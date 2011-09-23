class CreatePeriodos <  ActiveRecord::Migration
  def self.up
    create_table "periodos" do |t|
       t.column :mes, :date, :null => false
       t.column :anio, :date
       t.column :fecha_liquidacion, :date

      t.timestamps
    end

  end

  def self.down
    drop_table "periodos"
  end
end
