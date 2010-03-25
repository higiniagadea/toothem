class TipoDocumento < ActiveRecord::Base
  has_many :profesionales
  has_many :pacientes

  validates_presence_of :descripcion, :message=>"debe ingresar una descripcion"

end
