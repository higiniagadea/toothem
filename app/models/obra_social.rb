class ObraSocial < ActiveRecord::Base
  acts_as_paranoid

  has_many :titulares
  has_many :aranceles
  has_many :tratamientos
  has_many :fichas
  has_many :prestaciones, :through => :aranceles
  has_many :saldos_obras_sociales
  has_many :pagos_obras_sociales
 
  
  validates_presence_of :nombre, :message => ', debe ingresar un nombre y apellido'
  
  #validates_inclusion_of :codigos_por_mes, :in => 1..999, :message => 'el número máximo de códigos por mes debe ser un número entre 1 y 999'
  
#scope_builder
  named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
          { :nombre => '%'+nombre.downcase+'%'} ]
    }
  }
  named_scope :by_auditoria_previa, lambda { |auditoria_previa|
    {
      :conditions => ['auditoria_previa = :auditoria_previa',
        { :auditoria_previa => auditoria_previa } ]
    }
  }
  named_scope :by_auditoria_post, lambda { |auditoria_post|
    {
      :conditions => ['auditoria_post = :auditoria_post',
        { :auditoria_post => auditoria_post } ]
    }
  }
  named_scope :by_incluye_ficha, lambda { |incluye_ficha|
    {
      :conditions => ['incluye_ficha = :incluye_ficha',
        { :incluye_ficha => incluye_ficha } ]
    }
  }
  

  named_scope :limitar, :limit => 15

  def self.basic_search(options)
    
    scope_builder do |builder|
      
        builder.by_nombre(options[:nombre]) if options[:nombre]
        builder.by_auditoria_previa(options[:auditoria_previa]) if options[:auditoria_previa]
        builder.by_auditoria_post(options[:auditoria_post]) if options[:auditoria_post]
        builder.by_incluye_ficha(options[:incluye_ficha]) if options[:incluye_ficha]

        builder.limitar
    end
      
      end

  def self.busqueda(options)

    scope_builder do |builder|
      builder.by_nombre(options[:nombre]) if options[:nombre]
    end
  end

end