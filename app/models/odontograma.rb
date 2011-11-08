class Odontograma < ActiveRecord::Base
  
  has_many :paciente
  belongs_to :color
  has_many :acciones

end