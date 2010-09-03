class Ficha < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :profesional
  has_many :tratamientos

end
