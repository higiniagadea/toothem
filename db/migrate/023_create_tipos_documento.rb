class CreateTiposDocumento < ActiveRecord::Migration
  def self.up
    create_table :tipos_documento do |t|
      t.string :descripcion, :limit=>100

     t.timestamps
    end
    
  end

  def self.down
    drop_table :tipos_documento
  end
end
