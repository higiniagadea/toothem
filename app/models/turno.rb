class Turno < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :profesional
  belongs_to :paciente

   #validates_presence_of :fecha_hora, :message => ' no puede estar en blanco'
   #validates_uniqueness_of :fecha_hora, :scope => [:profesional_id, :duracion], :message => "El horario ya fue asignado con anterioridad"
 validate :valida_fecha_hora
   def valida_fecha_hora
     fecha_desde = self.fecha_hora - self.duracion.minutes
     fecha_hasta = self.fecha_hora + self.duracion.minutes
    
     turno = Turno.find(:first, :conditions => ['(fecha_hora between ? and?) and profesional_id = ?',  fecha_desde, fecha_hasta, self.profesional_id])
     tarea = Tarea.find(:first, :conditions => ['(fecha_hora between ? and?) and profesional_id = ?',  fecha_desde, fecha_hasta, self.profesional_id])
     errors.add('Verifique la fecha y hora asignada') unless  turno.blank? && tarea.blank?
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

  named_scope :by_paciente_desc, lambda { |paciente_desc|
    {
      :conditions => ['paciente_desc= :paciente_id',
                 {:paciente_desc=> paciente_desc }]
    }
  }




def self.basic_search(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
    builder.by_paciente_desc(options[:paciente_desc]) unless options[:paciente_desc].blank?
    builder.by_profesional_id(options[:profesional_id]) unless options[:profesional_id].blank?
  end
end


end

