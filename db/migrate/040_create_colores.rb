class CreateColores <  ActiveRecord::Migration
  def self.up
    create_table 'colores' do |t|

       t.string :color, :string, :limit => 100


      t.timestamps
    end
     Color.create :color => 'Azul'
     Color.create :color => 'Rojo'
     Color.create :color => 'trat a realizar'
     Color.create :color => 'trat realizado'
  end

  def self.down
    drop_table 'colores'
  end
end

