class Prestacion < ActiveRecord::Base
  belongs_to :consultorio
  has_many :obras_sociales, :through => :aranceles
  #validates
  validates_uniqueness_of :codigo, :message => ', ya existe en los registros'
  validates_presence_of :codigo, :descripcion, :message => ', no debe estar vacío'
end
