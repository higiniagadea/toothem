class Localidad < ActiveRecord::Base
  has_many :pacientes 
end
