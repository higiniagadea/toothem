class CreateProfesionales < ActiveRecord::Migration
  def self.up
    create_table "profesionales" do |t|

      t.column :nombre, :string
      t.column :documento, :string
      t.column :email, :string
      t.column :direccion, :string
      t.column :telefono, :string
      t.column :matricula, :string

      t.column :usuario_id, :integer
      t.column :consultorio_id, :integer

    end
  end

  def self.down
    drop_table "profesionales"
  end
end
