class CreateDientes <  ActiveRecord::Migration
  def self.up
    create_table "dientes" do |t|
       t.column :odontograma_id, :integer
       t.column :numero_diente, :integer, :limit => 100
       t.column :superior, :integer
       t.column :izquierda, :integer
       t.column :derecho, :integer
       t.column :inferior, :integer
       t.column :centro, :integer


      t.timestamps
    end

  end

  def self.down
    drop_table "dientes"
  end
end