class CreateCaras < ActiveRecord::Migration
  def self.up
    create_table :caras do |t|
      t.string :descripcion, :limit=>100

      t.timestamps
    end
    Cara.create :descripcion=>'externa'
    Cara.create :descripcion=>'interna'
    Cara.create :descripcion=>'superficie'
    Cara.create :descripcion=>'superficie masticatoria'
    Cara.create :descripcion=>'raiz'
  end

  def self.down
    drop_table :caras
  end
end