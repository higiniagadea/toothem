class HistoriaClinicaGeneral < ActiveRecord::Base
belongs_to :paciente, :dependent => :destroy


  #validates_presence_of :leyenda_declaracion_jurada, :message => 'No puede estar en blanco'

 def leyenda_declaracion_jurada=(value)
    write_attribute :leyenda_declaracion_jurada, (value ? (value == '1' ? true : false) : false)
  end

end
