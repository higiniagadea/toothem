class SaldoObraSocial < ActiveRecord::Base
  acts_as_paranoid
  
   belongs_to :obra_social
end
