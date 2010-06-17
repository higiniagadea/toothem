class EstadoLaboral < ActiveRecord::Base
  has_many :profesionales
  validates_presence_of :descripcion, :message=>" requerido"
  validates_uniqueness_of :descripcion, :message=>" ya existe con el mismo nombre"

end
