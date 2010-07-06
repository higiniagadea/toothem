class Prestacion < ActiveRecord::Base
  belongs_to :consultorio
  has_many :obras_sociales, :through => :aranceles
  belongs_to :tratamiento

  #validates
  validates_uniqueness_of :codigo, :message => ', ya existe en los registros'
  validates_presence_of :codigo, :descripcion, :message => ', no debe estar vacío'
  def codigo_descripcion
    "#{codigo} - #{descripcion}"
  end
end
