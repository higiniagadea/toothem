class CreateLocalidades < ActiveRecord::Migration
  def self.up
    create_table "localidades" do |t|
      t.column :descripcion, :string, :limit=>100
      
     end
    Localidad.create :descripcion=>'Corrientes'
   end

  def self.down
    drop_table  "localidades"
  end
end