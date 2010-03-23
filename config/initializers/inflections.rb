# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
  inflect.irregular 'paciente', 'pacientes'
  inflect.irregular 'historia_clinica_general', 'historias_clinicas_generales'
  inflect.irregular 'historia_clinica_cirugia', 'historias_clinicas_cirugias'
  inflect.irregular 'historia_clinica_ortodoncia', 'historias_clinicas_ortodoncias'
  inflect.irregular 'titular', 'titulares'
  inflect.irregular 'tratamiento', 'tratamientos'
  inflect.irregular 'prestacion', 'prestaciones'
  inflect.irregular 'odontograma', 'odontogramas'
  inflect.irregular 'estado_tratamiento', 'estados_tratamientos'
  inflect.irregular 'obra_social', 'obras_sociales'
  inflect.irregular 'ficha', 'fichas'
  inflect.irregular 'arancel', 'aranceles'
  inflect.irregular 'profesional', 'profesionales'
  inflect.irregular 'imagen', 'imagenes'
  inflect.irregular 'archivo', 'archivos'
  inflect.irregular 'usuario', 'usuarios'
  inflect.irregular 'item', 'items'
  inflect.irregular 'consultorio', 'consultorios'
  inflect.irregular 'clinica', 'clinicas'
  inflect.irregular 'perfil', 'perfiles'
  inflect.irregular 'tipo_cuenta', 'tipos_cuentas'
  inflect.irregular 'item', 'items'
  inflect.irregular 'tipo_documento', 'tipos_documento'
  inflect.irregular 'estado_laboral', 'estados_laborales'
  



#   inflect.uncountable %w( fish sheep )
end
