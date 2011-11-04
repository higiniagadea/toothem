class CreateOdontogramas <  ActiveRecord::Migration
  def self.up
    create_table "odontogramas" do |t|

        t.column :paciente_id, :integer
        t.column :fecha_creacion, :date
        t.column :fecha_ultima_modificacion, :date
        t.column :observaciones, :string

      t.timestamps
    end

  end

  def self.down
    drop_table "odontogramas"
  end
end
