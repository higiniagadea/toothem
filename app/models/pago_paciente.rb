class PagoPaciente < ActiveRecord::Base
#set_table_name 'pagos_pacientes'

 belongs_to :paciente
 
end