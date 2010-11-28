class CreateEstados <  ActiveRecord::Migration
  def self.up
    create_table "estados" do |t|
       t.string :nombre, :limit=> 100

      t.timestamps
    end
    Estado.create :nombre=> 'pendiente'
    Estado.create :nombre=> 'autorizada'
    Estado.create :nombre=> 'no autorizada'




    
  end

  def self.down
    drop_table "estados"
  end
end