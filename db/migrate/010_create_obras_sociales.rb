class CreateObrasSociales < ActiveRecord::Migration
  def self.up
    create_table "obras_sociales" do |t|
        t.column :nombre, :string, :limit => 30
        t.column :auditoria_previa, :boolean, :default => false
        t.column :auditoria_post, :boolean, :default => false
        t.column :incluye_ficha, :boolean, :default => false
        t.column :nro_max_codigos_por_mes, :integer, :limit => 3
        t.column :consultorio_id , :integer
        t.column :deleted_at, :date

    end
  end

  def self.down
    drop_table "obras_sociales"
  end
end
