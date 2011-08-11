class Tarea < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :profesional, :dependent => :destroy

  validates_presence_of :fecha_hora, :message => ' no puede estar en blanco'
  

validate :valida_fecha_hora
   def valida_fecha_hora
     fecha_desde = self.fecha_hora - self.duracion.minutes
     fecha_hasta = self.fecha_hora + self.duracion.minutes
 
     tarea = Tarea.find(:first, :conditions => ['(fecha_hora between ? and?) and profesional_id = ?',  fecha_desde, fecha_hasta, self.profesional_id])
    turno = Turno.find(:first, :conditions => ['(fecha_hora between ? and?) and profesional_id = ?',  fecha_desde, fecha_hasta, self.profesional_id])
     errors.add('Verifique la fecha y hora asignada') unless tarea.blank? && turno.blank?
   end

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
