class Tarea < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :profesional

  validates_presence_of :fecha_hora, :message => ' no puede estar en blanco'
  validates_uniqueness_of :fecha_hora, :scope => [:profesional_id], :message => "El horario ya fue asignado con anterioridad"

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

def self.buscar(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
     
    builder.by_profesional_id(options[:profesional_id]) unless options[:profesional_id].blank?
  end
end

end
