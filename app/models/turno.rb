class Turno < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :profesional
  belongs_to :paciente

   validates_presence_of :fecha_hora, :message => ' no puede estar en blanco'

  named_scope :by_fechas, lambda { |fecha_desde, fecha_hasta|
    {
     :conditions => ['fecha_hora between :fecha_desde and :fecha_hasta',
        { :fecha_desde => fecha_desde,
         :fecha_hasta => fecha_hasta} ]
    }
  }

 
   named_scope :by_profesional_id, lambda { |profesional_id|
    {
      :conditions => ['profesional_id= :profesional_id',
                 {:profesional_id => profesional_id }]
    }
  }

  named_scope :by_paciente_id, lambda { |paciente_id|
    {
      :conditions => ['paciente_id= :paciente_id',
                 {:paciente_id => paciente_id }]
    }
  }




def self.basic_search(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
     builder.by_paciente_id(options[:paciente_id]) unless options[:paciente_id].blank?
    builder.by_profesional_id(options[:profesional_id]) unless options[:profesional_id].blank?
  end
end


end

