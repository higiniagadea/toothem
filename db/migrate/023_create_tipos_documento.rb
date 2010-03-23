class CreateTiposDocumento < ActiveRecord::Migration
  def self.up
    create_table :tipos_documento do |t|
      t.string :descripcion, :limit=>100

     t.timestamps
    end
    TipoDocumento.create :descripcion=>'D.N.I.'
    TipoDocumento.create :descripcion=>'C.U.I.T.'
    TipoDocumento.create :descripcion=>'C.U.I.L.'
    TipoDocumento.create :descripcion=>'L.E.'
    TipoDocumento.create :descripcion=>'C.I.'
  end

  def self.down
    drop_table :tipos_documento
  end
end
