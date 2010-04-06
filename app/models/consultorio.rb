class Consultorio < ActiveRecord::Base
  has_many :profesionales
  has_many :prestaciones
end
