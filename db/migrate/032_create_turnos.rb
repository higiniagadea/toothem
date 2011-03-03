class CreateTurnos <  ActiveRecord::Migration
  def self.up
    create_table "turnos" do |t|
       t.column :fecha, :date, :null => false
       t.column :hora, :time, :null => false
       t.column :duracion, :integer, :null=> false
       t.column :profesional_id, :integer, :null => false
       t.column :paciente_id, :integer, :null => false
       t.column :observaciones, :string, :limit => 255

      t.timestamps
    end





  end

  def self.down
    drop_table "turnos"
  end
end
