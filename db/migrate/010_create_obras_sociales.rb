class CreateObrasSociales < ActiveRecord::Migration
  def self.up
    create_table "obras_sociales" do |t|
        t.column :nombre, :string, :limit => 30
        t.column :domicilio, :string, :default => false
        t.column :telefono, :string, :default => false
      
        t.column :deleted_at, :date

    end
  end

  def self.down
    drop_table "obras_sociales"
  end
end
