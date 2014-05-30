class Color < ActiveRecord::Base
  set_table_name 'colores'
  has_many :odontogramas

end
