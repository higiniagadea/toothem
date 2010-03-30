class Consultorio < ActiveRecord::Base
  has_many :profesionales
  belongs_to :clinica
end
