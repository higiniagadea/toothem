class Turno < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :profesional
  belongs_to :paciente

  named_scope :by_fechas, lambda { |fecha_desde, fecha_hasta|
    {
     :conditions => ['fecha between :fecha_desde and :fecha_hasta',
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


     named_scope :by_paciente_id_matricula, lambda { |paciente_id_matricula|
    {
      :conditions=> ['lower(matricula) LIKE :matricula',
          { :paciente_id_matricula => "%"+matricula.downcase+"%"} ]
    }
  }


def self.basic_search(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
    
    builder.by_profesional_id(options[:profesional_id]) unless options[:profesional_id].blank?
  end
end

def self.buscar(options)
  scope_builder do |builder|
   builder.by_paciente_id_matricula(options[:paciente_id_matricula]) unless options[:paciente_id_matricula].blank?
  end
end

end

