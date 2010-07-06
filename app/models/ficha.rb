class Ficha < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :profesional
  belongs_to :tratamiento
end
