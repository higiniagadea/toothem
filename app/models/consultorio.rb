class Consultorio < ActiveRecord::Base
  has_many :profesionales

  has_many :prestaciones

  belongs_to :clinica

  validates_presence_of :nombre, :message => " requerido"



end
