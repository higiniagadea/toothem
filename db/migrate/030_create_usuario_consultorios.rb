class CreateUsuarioConsultorios < ActiveRecord::Migration
  def self.up
    create_table :usuario_consultorios do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :usuario_consultorios
  end
end
