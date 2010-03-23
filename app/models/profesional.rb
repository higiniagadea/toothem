class Profesional < ActiveRecord::Base
  belongs_to :estado_laboral
  belongs_to :tipo_documento
  belongs_to :consultorio

  validates_presence_of :nombre, :message=>'Debe Ingresar un nombre'
end
