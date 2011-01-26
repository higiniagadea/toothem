class Paciente < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :titular, :dependent => :destroy
  belongs_to :consultorio
  belongs_to :archivo
  has_many :tratamiento, :dependent => :destroy



  belongs_to :tipo_documento
  has_one :historia_clinica_general, :dependent => :destroy
  has_one :historia_clinica_ortodoncia, :dependent => :destroy
  
  has_many :fichas, :dependent => :destroy
  has_many :imagenes, :dependent => :destroy

  validates_presence_of :nombre, :message => ' y apellido no pueden estar en blanco'
  validates_uniqueness_of :matricula, :message => ' Ya existe'
  validates_presence_of :domicilio_particular, :message => 'No puede estar en blanco'
  validates_presence_of :fecha_nacimiento, :message=> 'No puede estar en blanco'
  validates_uniqueness_of :nro_afiliado, :message=> 'Ya existe ese numero '

   named_scope :by_matricula, lambda { |matricula|
    {
      :conditions=> ['lower(matricula) LIKE :matricula',
          { :matricula => "%"+matricula.downcase+"%"} ]
    }
  }
  named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
          { :nombre => "%"+nombre.downcase+"%"} ]
    }
  }
  named_scope :by_tipo_documento_id, lambda { |tipo_documento_id|
    {
      :conditions => ['tipo_documento_id= :tipo_documento_id',
                 {:tipo_documento_id => tipo_documento_id }]
    }
  }
 
  #named_scope :by_consultorio, lambda { |consultorio|
    #{
     # :conditions => ['consultorio_id = :consultorio',
    #    { :consultorio => consultorio } ]
   # }
  #}


  def self.basic_search(options)
    scope_builder do |builder|
      builder.by_nombre(options[:nombre]) if options[:nombre]
      builder.by_matricula(options[:matricula]) if options[:matricula]
       builder.by_tipo_documento_id(options[:tipo_documento_id]) if options[:tipo_documento_id]
      #builder.by_consultorio

    end
  end
 
  
end
