class CreateColores <  ActiveRecord::Migration
  def self.up
    create_table "colores" do |t|

       t.string :descripcion, :limit => 100


      t.timestamps
    end
     Color.create :descripcion => 'Azul'
     Color.create :descripcion => 'Rojo'
     Color.create :descripcion => 'trat a realizar'
     Color.create :descripcion => 'trat realizado'
  end

  def self.down
    drop_table "colores"
  end
end

