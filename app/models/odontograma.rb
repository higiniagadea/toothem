class Odontograma < ActiveRecord::Base
  
  belongs_to :paciente
  belongs_to :color
  has_many :acciones
end