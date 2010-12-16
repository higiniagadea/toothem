class CreatePrestaciones < ActiveRecord::Migration
  def self.up
    create_table :prestaciones do |t|
      t.integer :codigo
      t.string :descripcion
      t.integer :consultorio_id
      t.integer :valor

    end
  end

  def self.down
    drop_table :prestaciones
  end
end
