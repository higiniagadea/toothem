class CreateTitulares < ActiveRecord::Migration
 def self.up
    create_table "titulares" do |t|
        t.column :nombre, :string, :limit => 100
        t.column :matricula, :string, :limit => 50
        t.column :obra_social_id, :integer
        t.column :consultorio_id , :integer
        t.column :deleted_at, :date, :null => true
        t.column :nro_afiliado, :integer

    end
  end

  def self.down
    drop_table "titulares"
  end
end
