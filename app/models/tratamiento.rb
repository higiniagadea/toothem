class Tratamiento < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :prestacion
  belongs_to :profesional
  belongs_to :obra_social
  has_one :fichas
  accepts_nested_attributes_for :fichas
  belongs_to :estado_tratamiento

 
  validates_numericality_of :diente, :message => 'Debe ser numerico'
  validates_presence_of :diente, :message => 'Ingrese el Diente'
  validates_presence_of :cara, :message => 'Ingrese la Cara'


end
