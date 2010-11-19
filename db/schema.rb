# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 30) do

  create_table "aranceles", :force => true do |t|
    t.integer "obra_social_id"
    t.integer "prestacion_id"
    t.float   "importe_cubierto"
    t.float   "coseguro"
  end

  create_table "archivos", :force => true do |t|
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.integer "width"
    t.integer "height"
    t.integer "db_file_id"
  end

  create_table "clinicas", :force => true do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "cuit"
  end

  create_table "consultorios", :force => true do |t|
    t.string  "nombre"
    t.integer "clinica_id"
  end

  create_table "db_files", :force => true do |t|
    t.binary "data"
  end

  create_table "estados_laborales", :force => true do |t|
    t.string   "descripcion", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados_tratamientos", :force => true do |t|
    t.string   "nombre",     :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fichas", :force => true do |t|
    t.date    "fecha"
    t.integer "localidad_id"
    t.integer "paciente_id"
    t.integer "profesional_id"
    t.integer "obra_social_id"
    t.integer "odontograma_id"
    t.string  "estado",         :limit => 1, :null => false
  end

  create_table "historias_clinicas_generales", :force => true do |t|
    t.integer "paciente_id"
    t.boolean "alergia_anestesia"
    t.boolean "alergia_drogas_medicamentos"
    t.string  "desc_alergia_drogas_medicamentos"
    t.boolean "asma_bronquial"
    t.boolean "epilepsia"
    t.boolean "ictericia"
    t.boolean "perdida_peso"
    t.boolean "fiebre_reumeatica"
    t.boolean "enfermedades_sanguineas"
    t.boolean "enfermedades_cardiacas"
    t.boolean "diabetes"
    t.boolean "problemas_endocrinos"
    t.boolean "problemas_emocionales"
    t.boolean "tuberculosis"
    t.boolean "problemas_respiratorios"
    t.boolean "problemas_gastrointestinales"
    t.boolean "ulceras"
    t.boolean "problemas_visuales"
    t.boolean "glaucoma"
    t.boolean "jaquecas"
    t.boolean "desordenes_piel"
    t.boolean "desordenes_tiroides"
    t.boolean "sarampion"
    t.boolean "trastornos_psicologicos"
    t.boolean "parotiditis"
    t.boolean "trastornos_auditivos"
    t.boolean "varicela"
    t.boolean "trastornos_oseos"
    t.boolean "viruelas"
    t.boolean "trastornos_renales"
    t.boolean "escarlatina"
    t.boolean "trastornos_hepaticos"
    t.boolean "artritis"
    t.boolean "artrosis"
    t.boolean "hepatitis"
    t.boolean "infecciones_bucales_frecuentes"
    t.boolean "hemofilia"
    t.boolean "enfermedades_transmision_sexual"
    t.boolean "anemia"
    t.boolean "herpes"
    t.boolean "hiv"
    t.boolean "homosexualidad"
    t.boolean "transfusiones"
    t.boolean "dialisis"
    t.boolean "embarazo"
    t.boolean "ganglios"
    t.boolean "hipertension"
    t.boolean "hipotension"
    t.boolean "derrame_cerebral"
    t.boolean "bronquitis_cronica"
    t.boolean "fiebre"
    t.boolean "sudoracion_fiebre_nocturna"
    t.boolean "moretones_facilmente"
    t.boolean "sangrado_excesivo_heridas"
    t.boolean "vacuna_antihepatitis"
    t.boolean "vacuna_antitetanica"
    t.string  "cuando_vacuna_antitetanica"
    t.boolean "usado_usa_alcohol"
    t.string  "promedio_por_semana_en_litros"
    t.boolean "usado_usa_drogas"
    t.string  "tipo_drogas_usadas"
    t.string  "cantidad_drogas_usadas"
    t.boolean "usado_usa_tabaco"
    t.string  "tipo_tabaco_usado"
    t.string  "cantidad_tabaco_usado"
    t.string  "presion_arterial_promedio"
    t.text    "farmacos_consumidos_ultimos_anios"
    t.text    "otros"
    t.text    "observaciones"
    t.text    "leyenda_declaracion_jurada"
  end

  create_table "historias_clinicas_ortodoncias", :force => true do |t|
    t.integer "paciente_id"
    t.string  "nombre_apellido_padre"
    t.string  "ocupacion_padre"
    t.string  "nombre_apellido_madre"
    t.string  "ocupacion_madre"
    t.integer "cantidad_hermanos"
    t.text    "nombres_edades_hermanos"
    t.string  "nombre_apellido_medico_familiar"
    t.string  "domicilio_medico"
    t.string  "vive_con"
    t.string  "nombre_conyuge"
    t.boolean "tratamiento_medico"
    t.boolean "tomando_medicamentos"
    t.string  "cual_medicamento"
    t.boolean "atencion_medica_ultimos_dos_anios"
    t.string  "condicion"
    t.string  "peso"
    t.string  "altura"
    t.boolean "trastorno_fisico"
    t.string  "cual_trastorno_fisico"
    t.boolean "trastorno_psiquico"
    t.string  "cual_trastorno_psiquico"
    t.boolean "fue_hospitalizado"
    t.string  "causa_hospitalizacion"
    t.boolean "operado_amigdalas"
    t.integer "edad_operado_amigdalas"
    t.boolean "operado_adenoides"
    t.integer "edad_operado_adenoides"
    t.boolean "operado_apendice"
    t.integer "edad_operado_apendice"
    t.boolean "alergia_anestesia"
    t.boolean "alergia_drogas_medicamentos"
    t.string  "desc_alergia_drogas_medicamentos"
    t.boolean "asma_bronquial"
    t.boolean "epilepsia"
    t.boolean "ictericia"
    t.boolean "perdida_peso"
    t.boolean "fiebre_reumeatica"
    t.boolean "enfermedades_sanguineas"
    t.boolean "enfermedades_cardiacas"
    t.boolean "diabetes"
    t.boolean "problemas_endocrinos"
    t.boolean "problemas_emocionales"
    t.boolean "tuberculosis"
    t.boolean "problemas_respiratorios"
    t.boolean "problemas_gastrointestinales"
    t.boolean "ulceras"
    t.boolean "problemas_visuales"
    t.boolean "glaucoma"
    t.boolean "jaquecas"
    t.boolean "desordenes_piel"
    t.boolean "desordenes_tiroides"
    t.boolean "sarampion"
    t.boolean "trastornos_psicologicos"
    t.boolean "parotiditis"
    t.boolean "trastornos_auditivos"
    t.boolean "varicela"
    t.boolean "trastornos_oseos"
    t.boolean "viruelas"
    t.boolean "trastornos_renales"
    t.boolean "escarlatina"
    t.boolean "trastornos_hepaticos"
    t.boolean "artritis"
    t.boolean "artrosis"
    t.boolean "hepatitis"
    t.boolean "infecciones_bucales_frecuentes"
    t.boolean "hemofilia"
    t.boolean "enfermedades_transmision_sexual"
    t.boolean "anemia"
    t.boolean "herpes"
    t.boolean "hiv"
    t.boolean "homosexualidad"
    t.boolean "transfusiones"
    t.boolean "dialisis"
    t.boolean "embarazo"
    t.boolean "ganglios"
    t.boolean "hipertension"
    t.boolean "hipotension"
    t.boolean "derrame_cerebral"
    t.boolean "bronquitis_cronica"
    t.boolean "fiebre"
    t.boolean "sudoracion_fiebre_nocturna"
    t.boolean "moretones_facilmente"
    t.boolean "sangrado_excesivo_heridas"
    t.boolean "vacuna_antihepatitis"
    t.boolean "vacuna_antitetanica"
    t.string  "cuando_vacuna_antitetanica"
    t.boolean "usado_usa_alcohol"
    t.string  "promedio_por_semana_en_litros"
    t.boolean "usado_usa_drogas"
    t.string  "tipo_drogas_usadas"
    t.string  "cantidad_drogas_usadas"
    t.boolean "usado_usa_tabaco"
    t.string  "tipo_tabaco_usado"
    t.string  "cantidad_tabaco_usado"
    t.string  "presion_arterial_promedio"
    t.text    "farmacos_consumidos_ultimos_anios"
    t.text    "otros"
    t.text    "observaciones"
    t.boolean "fue_al_odontologo_anteriormente"
    t.string  "fecha_ultimo_control_odontologico"
    t.string  "razon_concurrencia"
    t.boolean "dolor_ruido_articulaciones_maxilares"
    t.boolean "dientes_traumatizados"
    t.boolean "correccion_foniatrica"
    t.boolean "succion_pulgar"
    t.integer "succion_pulgar_hasta_edad_de"
    t.boolean "rechinamiento_dentario"
    t.string  "cuando_rechinamiento_dentario"
    t.boolean "succion_digital"
    t.integer "succion_digital_hasta_edad_de"
    t.boolean "empuje_lingual"
    t.boolean "mordedura_succion_labio"
    t.boolean "presion_labial"
    t.boolean "respirador_bucal"
    t.boolean "come_unas"
    t.boolean "uso_chupete"
    t.boolean "uso_mamadera"
    t.boolean "amamantamiento"
    t.string  "tiempo_amamantamiento"
    t.boolean "dificultad_masticar"
    t.boolean "dificultad_tragar"
    t.boolean "dificultad_hablar"
    t.string  "estado_bucal_general"
    t.string  "indice_caries"
    t.string  "cierre_labial"
    t.text    "periodonto"
    t.string  "cepilla_dientes"
    t.string  "cepilla_dientes_cuando"
    t.boolean "usa_hilo_dental"
    t.string  "indice_placa"
    t.string  "tratamiento_fluor"
    t.string  "topicaciones"
    t.string  "buches"
    t.boolean "anomalias_forma"
    t.boolean "perdida_osea_cresta_alveolar"
    t.boolean "agenesias"
    t.boolean "lesion_periapical"
    t.boolean "supernumerarios"
    t.boolean "lesion_intraradicular"
    t.boolean "ectopicos"
    t.boolean "fractura_coronaria"
    t.boolean "retenidos"
    t.boolean "fractura_radicular"
    t.boolean "anquilosados"
    t.boolean "reabsorcion_coronaria"
    t.boolean "odontomas"
    t.boolean "reabsorcion_radicular"
    t.boolean "erupcion_retrasada"
    t.boolean "erupcion_precoz"
    t.boolean "exceso_obturacion"
    t.boolean "caries_esmalte"
    t.boolean "caries_dentina"
    t.boolean "caries_cemento"
    t.text    "comentarios"
    t.text    "rx_panoramica"
    t.text    "rx_seriada"
    t.text    "teleradiografia_perfil"
    t.text    "rx_diagnostico_clinico"
    t.boolean "consulta_ortodoncica_previa"
    t.string  "fecha_consulta_ortodoncica"
    t.string  "medico_consulta_ortodoncica"
    t.string  "interes_paciente_tratamiento_ortodoncico"
    t.boolean "algun_familiar_tratamiento_ortodoncico_ortopedico"
    t.text    "otros_comentarios_ortodoncia"
    t.text    "dientes_presentes_boca"
    t.text    "evaluacion_clinica"
    t.boolean "limitacion"
    t.boolean "desviacion"
    t.boolean "hipermovilidad"
    t.boolean "ruidos"
    t.boolean "lateralidad"
    t.boolean "hacia_derecha"
    t.boolean "hacia_izquierda"
    t.boolean "chasquido"
    t.boolean "crepitacion"
    t.boolean "dolor"
    t.boolean "espontaneo"
    t.boolean "localizado"
    t.boolean "difuso"
    t.boolean "durante_funcion"
    t.boolean "palpacion_articular_lateral"
    t.boolean "palpacion_articular_posterior"
    t.boolean "radiografia_panoramica"
    t.boolean "historial_traba_bloqueo_mandibular"
    t.boolean "con_dolor"
    t.boolean "con_ruido"
    t.boolean "con_movimiento_limitado"
    t.text    "examen_tejidos_blandos"
    t.text    "examen_relaciones_dentarias"
    t.text    "ficha_tejidos_blandos_intraorales"
    t.text    "montaje_en_articulador"
    t.text    "diagnostico_ortodoncia"
    t.text    "tratamiento_objetivos_principales"
    t.text    "mecanica_arco_recto_propuesta_tratamiento"
    t.text    "tratamiento_primera_etapa"
    t.text    "tratamiento_segunda_etapa"
    t.text    "tratamiento_tercera_etapa"
    t.text    "leyenda_declaracion_jurada"
  end

  create_table "imagenes", :force => true do |t|
    t.integer "paciente_id"
    t.integer "archivo_id"
    t.string  "descripcion"
    t.text    "observaciones"
    t.date    "fecha"
  end

  create_table "items", :force => true do |t|
    t.string  "nombre"
    t.string  "url"
    t.string  "metodo_http"
    t.integer "orden"
    t.boolean "estatico"
    t.boolean "activo",            :default => true
    t.string  "url_imagen"
    t.integer "parent_id"
    t.integer "children_count"
    t.integer "ancestors_count"
    t.integer "descendants_count"
    t.integer "position"
    t.boolean "hidden"
  end

  create_table "obras_sociales", :force => true do |t|
    t.string  "nombre",                  :limit => 100
    t.boolean "auditoria_previa"
    t.boolean "auditoria_post"
    t.boolean "incluye_ficha"
    t.integer "nro_max_codigos_por_mes"
    t.integer "consultorio_id"
  end

  create_table "pacientes", :force => true do |t|
    t.string   "nombre",                              :null => false
    t.integer  "tipo_documento_id"
    t.string   "matricula",            :limit => 50,  :null => false
    t.string   "sexo",                                :null => false
    t.string   "estado_civil",         :limit => 100
    t.string   "domicilio_particular",                :null => false
    t.string   "domicilio_laboral"
    t.date     "fecha_nacimiento"
    t.string   "grupo_sanguineo"
    t.string   "telefono_particular"
    t.string   "telefono_laboral"
    t.string   "movil",                :limit => 100
    t.string   "profesion",            :limit => 150
    t.string   "ocupacion",            :limit => 150
    t.string   "nivel_escolar",        :limit => 150
    t.string   "nro_afiliado",         :limit => 150
    t.integer  "archivo_id"
    t.integer  "consultorio_id"
    t.integer  "titular_id"
    t.integer  "localidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id",                          :null => false
    t.date     "deleted_at"
  end

  create_table "perfiles", :force => true do |t|
    t.string  "nombre"
    t.boolean "estatico"
  end

  create_table "perfiles_items", :force => true do |t|
    t.integer "perfil_id"
    t.integer "item_id"
  end

  add_index "perfiles_items", ["item_id"], :name => "index_perfiles_items_on_item_id"
  add_index "perfiles_items", ["perfil_id"], :name => "index_perfiles_items_on_perfil_id"

  create_table "permisos", :force => true do |t|
    t.integer "perfil_id"
    t.integer "item_id"
    t.boolean "crear_editar"
    t.boolean "ver"
    t.boolean "borrar"
  end

  add_index "permisos", ["item_id"], :name => "index_permisos_on_item_id"
  add_index "permisos", ["perfil_id"], :name => "index_permisos_on_perfil_id"

  create_table "prestaciones", :force => true do |t|
    t.string  "codigo"
    t.string  "descripcion"
    t.integer "consultorio_id"
  end

  create_table "profesionales", :force => true do |t|
    t.string  "nombre"
    t.integer "tipo_documento_id"
    t.string  "documento"
    t.string  "email"
    t.string  "matricula_profesional"
    t.string  "direccion"
    t.string  "telefono"
    t.string  "movil"
    t.date    "fecha_nacimiento"
    t.date    "fecha_ingreso"
    t.integer "estado_laboral_id"
    t.integer "consultorio_id"
  end

  create_table "sessions", :force => true do |t|
    t.text     "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tipos_cuentas", :force => true do |t|
    t.string  "nombre"
    t.integer "cantidad_max_usuarios"
    t.integer "cantidad_max_consultorios"
  end

  create_table "tipos_documento", :force => true do |t|
    t.string   "descripcion", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titulares", :force => true do |t|
    t.string  "nombre",         :limit => 100
    t.string  "matricula"
    t.integer "obra_social_id"
    t.integer "consultorio_id"
    t.integer "nro_afiliado",                  :null => false
  end

  create_table "tratamientos", :force => true do |t|
    t.date    "fecha"
    t.integer "diente"
    t.string  "cara",                  :limit => 1
    t.date    "fecha_finalizacion"
    t.float   "importe_cubierto"
    t.float   "coseguro"
    t.boolean "fue_liquidado"
    t.date    "fecha_liquidacion"
    t.integer "odontograma_id"
    t.integer "paciente_id"
    t.integer "prestacion_id"
    t.integer "profesional_id"
    t.integer "obra_social_id"
    t.integer "estado_tratamiento_id"
    t.integer "ficha_id"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "perfil_id"
  end

  add_index "usuarios", ["login"], :name => "index_usuarios_on_login", :unique => true

  create_table "usuarios_consultorios", :force => true do |t|
    t.integer "usuario_id"
    t.integer "consultorio_id"
  end

  add_index "usuarios_consultorios", ["consultorio_id"], :name => "index_usuarios_consultorios_on_consultorio_id"
  add_index "usuarios_consultorios", ["usuario_id"], :name => "index_usuarios_consultorios_on_usuario_id"

end
