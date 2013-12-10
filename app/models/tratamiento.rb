  class Tratamiento < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :paciente
  belongs_to :prestacion
  belongs_to :profesional
  belongs_to :obra_social
  belongs_to :cara
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

  named_scope :by_tratamiento_paciente_id, lambda { |tratamiento_paciente_id|
   {
    
     :conditions => [ 'paciente_id= :tratamiento_paciente_id',
       {:tratamiento_paciente_id => tratamiento_paciente_id}
     ]
   }
 }

   named_scope :by_profesional_id, lambda { |profesional_id|
    {
      :conditions => ['profesional_id= :profesional_id',
                 {:profesional_id => profesional_id }]
    }
  }


def self.busqueda(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
    builder.by_tratamiento_paciente_id(options[:paciente_id]) unless options[:paciente_id].blank?
    builder.by_profesional_id(options[:profesional_id]) unless options[:profesional_id].blank?
  end
end

end
