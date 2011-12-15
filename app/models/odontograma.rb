class Odontograma < ActiveRecord::Base
   acts_as_paranoid
  has_many :paciente

  has_many :dientes

end