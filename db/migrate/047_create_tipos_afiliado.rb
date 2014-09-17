class CreateTiposAfiliado < ActiveRecord::Migration
  def self.up
    create_table :tipos_afiliado do |t|
      t.column :descripcion, :string

      t.timestamps
    end
    TipoAfiliado.create :descripcion=>'Adherente'
    TipoAfiliado.create :descripcion=>'Titular'
    
  end

  def self.down
    drop_table :tipos_afiliado
  end

end
