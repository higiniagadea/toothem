class Odontograma < ActiveRecord::Base
  
  has_many :paciente

  has_many :dientes

end