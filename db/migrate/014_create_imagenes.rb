class CreateImagenes < ActiveRecord::Migration
  def self.up
    create_table "imagenes" do |t|
      t.column :paciente_id, :integer
      t.column :archivo_id, :integer
      t.column :descripcion, :string
      t.column :observaciones, :text
      t.column :fecha, :date
    end
  end

  def self.down
    drop_table "imagenes"
  end
end
