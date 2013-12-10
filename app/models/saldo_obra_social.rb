class SaldoObraSocial < ActiveRecord::Base
  acts_as_paranoid
  
   belongs_to :obra_social
   has_many :periodos_obras_sociales
end
