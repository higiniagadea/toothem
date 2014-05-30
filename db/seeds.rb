# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

usuario = Usuario.create([{
    :login => "adm",
    :name => 'Admin',
    :password => "123456",
    :password_confirmation => "123456"
  }])

TipoDocumento.create :descripcion=>'D.N.I.'
TipoDocumento.create :descripcion=>'C.U.I.T.'
TipoDocumento.create :descripcion=>'C.U.I.L.'
TipoDocumento.create :descripcion=>'L.E.'
TipoDocumento.create :descripcion=>'C.I.'

pacientes = Paciente.create([{ :nombre => 'Carlos Barbiero',
                                                           :tipo_documento => 1,
                                                           :matricula => "27711711",
                                                           :domicilio_particular => "Blas Parera",
                                                           :domicilio_laboral => "9 julio",
                                                           :fecha_nacimiento => "12/10/1979",
                                                           :grupo_sanguineo => "0",
                                                           :telefono_particular => "03783",
                                                           :telefono_laboral => "037",
                                                           :sexo => "M",
                                                           :movil => "15",
                                                           :profesion => "X",
                                                           :ocupacion => "Y",
                                                           :nivel_escolar => "U. completo",
                                                           :nro_afiliado => "1111",
                                                           :archivo_id => 0,
                                                           :consultorio_id => 1,
                                                           :titular_id => 1,
                                                           :localidad_id => 1
                                                        },
                                                        {:nombre => 'Cecilia',
                                                           :tipo_documento => 1,
                                                           :matricula => "2000000",
                                                           :domicilio_particular => "Dr nicolini",
                                                           :domicilio_laboral => "25 mayo",
                                                           :sexo => "F",
                                                           :fecha_nacimiento => "12/02/1980",
                                                           :grupo_sanguineo => "0",
                                                           :telefono_particular => "03783",
                                                           :telefono_laboral => "037",
                                                           :movil => "15",
                                                           :profesion => "X",
                                                           :ocupacion => "Y",
                                                           :nivel_escolar => "U. completo",
                                                           :nro_afiliado => "1112",
                                                           :archivo_id => 0,
                                                           :consultorio_id => 1,
                                                           :titular_id => 2,
                                                           :localidad_id => 1}
                                                      ])
obras_sociales = ObraSocial.create([{
                                                           :nombre => 'IOSCOR',
                                                           :auditoria_previa => true,
                                                           :auditoria_post => true,
                                                           :incluye_ficha => true,
                                                           :nro_max_codigos_por_mes => 4,
                                                           :consultorio_id => 1
                                                        },
                                                        {
                                                           :nombre => 'OSECAC',
                                                           :auditoria_previa => true,
                                                           :auditoria_post => true,
                                                           :incluye_ficha => true,
                                                           :nro_max_codigos_por_mes => 6,
                                                           :consultorio_id => 1}
                                                      ])

titulares = Titular.create([{
                                                           :nombre => 'Carlos Barbiero',
                                                           :matricula => "27711711",
                                                           :obra_social_id=> 1,
                                                           :consultorio_id => 1
                                                        },
                                                        {
                                                           :nombre => 'Juan',
                                                           :matricula => "21234567",
                                                           :obra_social_id=> 2,
                                                           :consultorio_id => 1}
                                                      ])

Color.create :descripcion => 'Azul'
Color.create :descripcion => 'Rojo'
Color.create :descripcion => 'trat a realizar'
Color.create :descripcion => 'trat realizado'
