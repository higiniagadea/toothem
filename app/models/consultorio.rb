class Consultorio < ActiveRecord::Base
  has_many :profesionales
  belongs_to :clinica
  has_many :pacientes
  validates_presence_of :nombre, :message => " requerido"


end
