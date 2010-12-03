class Ficha < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :profesional
  has_many :tratamientos, :dependent => :destroy
  belongs_to :estado
  belongs_to :obra_social
  #accepts_nested_attributes_for :tratamientos



  named_scope :by_fechas, lambda { |fecha_desde, fecha_hasta|
    {
      :conditions => ['fecha between :fecha_desde and :fecha_hasta',
        { :fecha_desde => fecha_desde,
          :fecha_hasta => fecha_hasta} ]
    }
  }

  #named_scope :by_profesional, lambda { |profesionales|
   #{
    # :include => :profesional,
   #  :conditions => [ "profesionales.id IN (?)", profesionales ]
  # }
 #}

   named_scope :by_profesional_id, lambda { |profesional_id|
    {
      :conditions => ['profesional_id= :profesional_id',
                 {:profesional_id => profesional_id }]
    }
  }



  named_scope :by_ficha_paciente_id, lambda { |ficha_paciente_id|
    {
      :conditions => ['paciente_id= :ficha_paciente_id',
                 {:ficha_paciente_id => ficha_paciente_id}]
    }
  }

def self.buscar(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
    builder.by_profesional_id(options[:profesional_id]) unless options[:profesional_id].blank?
    builder.by_ficha_paciente_id(options[:paciente_id]) unless options[:paciente_id].blank?
  end
end

end

