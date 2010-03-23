class TipoDocumento < ActiveRecord::Base
  has_many :profesionales

  validates_presence_of :descripcion, :message=>"debe ingresar una descripcion"

end
