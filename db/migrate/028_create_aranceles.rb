class CreateAranceles < ActiveRecord::Migration
  def self.up
    create_table "aranceles" do |t|
      t.column :obra_social_id, :integer
      t.column :prestacion_id, :integer
      t.column :importe_cubierto, :float
      t.column :coseguro, :float
      t.column :deleted_at, :date, :null => true
    end
  end

  def self.down
    drop_table "aranceles"
  end
end
