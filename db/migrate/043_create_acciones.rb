class CreateAcciones <  ActiveRecord::Migration
  def self.up
    create_table :acciones do |t|
       t.column :nombre, :string, :limit=> 100

      t.timestamps
    end
    




  end

  def self.down
    drop_table :acciones
  end
end
