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

  named_scope :by_profesional, lambda { |profesionales|
   {
     :include => :profesional,
     :conditions => [ "profesionales.id IN (?)", profesionales ]
   }
 }


def self.buscar(options)
  scope_builder do |builder|
    builder.by_fechas(options[:fecha_desde], options[:fecha_hasta]) unless options[:fecha_desde].blank? && options[:fecha_hasta].blank?
    builder.by_profesional(options[:profesionales]) unless options[:profesionales].blank?
  end
end

end

