class Prestacion < ActiveRecord::Base
  belongs_to :consultorio
  has_many :obras_sociales, :through => :aranceles
  belongs_to :tratamiento

  #validates
  validates_presence_of :codigo, :message => ', ya existe en los registros'
 
  #def codigo_descripcion
   # "#{codigo} - #{descripcion}"
  #end
end
