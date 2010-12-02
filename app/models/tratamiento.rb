class Tratamiento < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :prestacion
  belongs_to :profesional
  belongs_to :obra_social
  belongs_to :ficha
  #accepts_nested_attributes_for :ficha
  belongs_to :estado_tratamiento

  validates_numericality_of :diente, :message => 'Debe ser numerico'
  validates_presence_of :diente, :message => 'Ingrese el Diente'
  validates_presence_of :cara, :message => 'Ingrese la Cara'



  named_scope :by_fechas, lambda { |fecha_desde, fecha_hasta|
    {
      :conditions => ['fecha between :fecha_desde and :fecha_hasta',
        { :fecha_desde => fecha_desde,
          :fecha_hasta => fecha_hasta} ]
    }
  }

  named_scope :by_profesional, lambda { |profesionales|
   {
     :include => :profesional,
     :conditions => [ "profesionales.id IN (?)", profesionales ]
   }
 }


def self.busqueda(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
    builder.by_profesional(options[:profesionales]) unless options[:profesionales].blank?
  end
end

end
