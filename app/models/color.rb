class Color < ActiveRecord::Base
  set_table 'colores'
  has_many :odontogramas
  
end
