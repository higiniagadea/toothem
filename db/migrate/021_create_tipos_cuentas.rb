class CreateTiposCuentas < ActiveRecord::Migration
  def self.up
    create_table "tipos_cuentas" do |t|
      t.column :nombre, :string, :limit => "255"
      t.column :cantidad_max_usuarios, :integer
      t.column :cantidad_max_consultorios, :integer
      

    end
  end

  def self.down
    drop_table "tipos_cuentas"
  end
end
