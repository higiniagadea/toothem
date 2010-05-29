class Clinica < ActiveRecord::Base
  has_many :consultorios

  validates_presence_of :nombre, :message => ' requerido'
  
end
