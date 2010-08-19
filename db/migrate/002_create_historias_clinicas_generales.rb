class CreateHistoriasClinicasGenerales < ActiveRecord::Migration
  def self.up
    #create_table "historias_clinicas_generales", :id => false do |t|
    create_table "historias_clinicas_generales"do |t|
      t.column :paciente_id, :integer # Clave primaria
      t.column :alergia_anestesia, :boolean, :null => true
      t.column :alergia_drogas_medicamentos, :boolean, :null => true
      t.column :desc_alergia_drogas_medicamentos, :string, :null => true
      t.column :asma_bronquial, :boolean, :null => true
      t.column :epilepsia, :boolean, :null => true
      t.column :ictericia, :boolean, :null => true
      t.column :perdida_peso, :boolean, :null => true
      t.column :fiebre_reumeatica, :boolean, :null => true
      t.column :enfermedades_sanguineas, :boolean, :null => true
      t.column :enfermedades_cardiacas, :boolean, :null => true
      t.column :diabetes, :boolean, :null => true
      t.column :problemas_endocrinos, :boolean, :null => true
      t.column :problemas_emocionales, :boolean, :null => true
      t.column :tuberculosis, :boolean, :null => true
      t.column :problemas_respiratorios, :boolean, :null => true
      t.column :problemas_gastrointestinales, :boolean, :null => true
      t.column :ulceras, :boolean, :null => true
      t.column :problemas_visuales, :boolean, :null => true
      t.column :glaucoma, :boolean, :null => true
      t.column :jaquecas, :boolean, :null => true
      t.column :desordenes_piel, :boolean, :null => true
      t.column :desordenes_tiroides, :boolean, :null => true
      t.column :sarampion, :boolean, :null => true
      t.column :trastornos_psicologicos, :boolean, :null => true
      t.column :parotiditis, :boolean, :null => true
      t.column :trastornos_auditivos, :boolean, :null => true
      t.column :varicela, :boolean, :null => true
      t.column :trastornos_oseos, :boolean, :null => true
      t.column :viruelas, :boolean, :null => true
      t.column :trastornos_renales, :boolean, :null => true
      t.column :escarlatina, :boolean, :null => true
      t.column :trastornos_hepaticos, :boolean, :null => true
      t.column :artritis, :boolean, :null => true
      t.column :artrosis, :boolean, :null => true
      t.column :hepatitis, :boolean, :null => true
      t.column :infecciones_bucales_frecuentes, :boolean, :null => true
      t.column :hemofilia, :boolean, :null => true
      t.column :enfermedades_transmision_sexual, :boolean, :null => true
      t.column :anemia, :boolean, :null => true
      t.column :herpes, :boolean, :null => true
      t.column :hiv, :boolean, :null => true
      t.column :homosexualidad, :boolean, :null => true
      t.column :transfusiones, :boolean, :null => true
      t.column :dialisis, :boolean, :null => true
      t.column :embarazo, :boolean, :null => true
      t.column :ganglios, :boolean, :null => true
      t.column :hipertension, :boolean, :null => true
      t.column :hipotension, :boolean, :null => true
      t.column :derrame_cerebral, :boolean, :null => true
      t.column :bronquitis_cronica, :boolean, :null => true
      t.column :fiebre, :boolean, :null => true
      t.column :sudoracion_fiebre_nocturna, :boolean, :null => true
      t.column :moretones_facilmente, :boolean, :null => true
      t.column :sangrado_excesivo_heridas, :boolean, :null => true
      t.column :vacuna_antihepatitis, :boolean, :null => true
      t.column :vacuna_antitetanica, :boolean, :null => true
      t.column :cuando_vacuna_antitetanica, :string, :null => true
      t.column :usado_usa_alcohol, :boolean, :null => true
      t.column :promedio_por_semana_en_litros, :string, :null => true
      t.column :usado_usa_drogas, :boolean, :null => true
      t.column :tipo_drogas_usadas, :string, :null => true
      t.column :cantidad_drogas_usadas, :string, :null => true
      t.column :usado_usa_tabaco, :boolean, :null => true
      t.column :tipo_tabaco_usado, :string, :null => true
      t.column :cantidad_tabaco_usado, :string, :null => true
      t.column :presion_arterial_promedio, :string, :null => true
      t.column :farmacos_consumidos_ultimos_anios, :text, :null => true
      t.column :otros, :text, :null => true
      t.column :observaciones, :text, :null => true
      t.column :leyenda_declaracion_jurada, :text, :null => true







    end

  end

  def self.down
    drop_table "historias_clinicas_generales"
  end
end
