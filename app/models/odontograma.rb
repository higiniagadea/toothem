class Odontograma < ActiveRecord::Base

  belongs_to :paciente
  belongs_to :color
end