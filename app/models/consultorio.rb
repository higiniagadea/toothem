class Consultorio < ActiveRecord::Base
  has_many :profesionales

  has_many :prestaciones

  belongs_to :clinica
  has_many :pacientes
  validates_presence_of :nombre, :message => " requerido"

 has_many :usuarios, :through => :usuarios_consultorios
 has_many :usuarios_consultorios
 #has_many :consultorios


end
