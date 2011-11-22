class CreateOdontogramas <  ActiveRecord::Migration
  def self.up
    create_table "odontogramas" do |t|

        t.column :paciente_id, :integer
        t.column :fecha_creacion, :date
        
        t.column :observaciones, :string
        t.column :ultimo, :boolean
        t.column :deleted_at, :date

      t.timestamps
    end

  end

  def self.down
    drop_table "odontogramas"
  end
end
