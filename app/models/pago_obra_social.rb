class PagoObraSocial < ActiveRecord::Base
#set_table_name 'pagos_pacientes'
 acts_as_paranoid
 belongs_to :obra_social
 
end
