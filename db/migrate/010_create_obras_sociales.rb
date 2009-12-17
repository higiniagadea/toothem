class CreateObrasSociales < ActiveRecord::Migration
  def self.up
    create_table "obras_sociales" do |t|
        t.column :nombre, :string, :limit => 100
        t.column :auditoria_previa, :boolean
        t.column :auditoria_post, :boolean
        t.column :incluye_ficha, :boolean
        t.column :nro_max_codigos_por_mes, :integer
        t.column :consultorio_id , :integer


    end
  end

  def self.down
    drop_table "obras_sociales"
  end
end
