class Consultorio < ActiveRecord::Base
  has_many :profesionales

  has_many :prestaciones

  belongs_to :clinica
  has_many :pacientes
  validates_presence_of :nombre, :message => " requerido"

 has_and_belongs_to_many :usuarios,:join_table => 'usuarios_consultorios', :class_name => 'Usuario'


end
