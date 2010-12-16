class HistoriaClinicaGeneral < ActiveRecord::Base
belongs_to :paciente


  validates_presence_of :leyenda_declaracion_jurada, :message => 'No puede estar en blanco'
end
