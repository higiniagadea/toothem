class CreateTiposAfiliado < ActiveRecord::Migration
  def self.up
    create_table :tipos_afiliado do |t|
      t.column :descripcion, :string

      t.timestamps
    end
     
  end

  def self.down
    drop_table :tipos_afiliado
  end

end
