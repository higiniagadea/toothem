class Ficha < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :profesional
  has_many :tratamientos
  #accepts_nested_attributes_for :tratamientos
end
