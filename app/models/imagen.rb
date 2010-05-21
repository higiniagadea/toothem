class Imagen < ActiveRecord::Base
  belongs_to :paciente

  #validates

  validates_presence_of :archivo_id, :descripcion, :message => ', no debe estar vacío'
  
  
end
