class CreateClinicas < ActiveRecord::Migration
  def self.up
    create_table "clinicas" do |t|
      t.column :nombre, :string
      t.column :direccion, :string
      t.column :cuit, :string, :limit => "255"
      t.column :deleted_at, :date
    end

  end


  def self.down
    drop_table "clinicas"
  end
end
