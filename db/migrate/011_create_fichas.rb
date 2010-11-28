class CreateFichas < ActiveRecord::Migration
 def self.up
    create_table "fichas" do |t|
        t.column :fecha, :date
        t.column :localidad_id, :integer
        t.column :paciente_id , :integer
        t.column :profesional_id , :integer
        t.column :obra_social_id , :integer
        t.column :odontograma_id , :integer
        t.column :estado_id , :integer


    end
  end

  def self.down
    drop_table "fichas"
  end
end
