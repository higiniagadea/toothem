class PagoPaciente < ActiveRecord::Base
#set_table_name 'pagos_pacientes'
 acts_as_paranoid
 belongs_to :paciente
 
end