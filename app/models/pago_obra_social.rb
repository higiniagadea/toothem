class PagoObraSocial < ActiveRecord::Base
#set_table_name 'pagos_pacientes'

 belongs_to :obra_social

end
