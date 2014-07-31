class Paciente < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :titular, :dependent => :destroy
  belongs_to :consultorio
  belongs_to :archivo
  has_many :tratamientos, :dependent => :destroy
  has_many :turnos, :dependent => :destroy
  has_many :pagos_pacientes
  belongs_to :saldo_paciente
  has_many :odontogramas
  belongs_to :tipo_documento
  has_one :historia_clinica_general
  has_one :historia_clinica_ortodoncia  
 
  has_many :imagenes

  validates_presence_of :nombre, :message => ' y apellido no pueden estar en blanco'
  validates_uniqueness_of :nro_documento, :message => ' Ya existe'
  validates_presence_of :domicilio_particular, :message => 'No puede estar en blanco'
  validates_presence_of :fecha_nacimiento, :message=> 'No puede estar en blanco'
  validates_uniqueness_of :nro_afiliado, :message=> 'Ya existe ese numero '

   named_scope :by_nro_documento, lambda { |nro_documento|
    {
      :conditions=> ['lower(nro_documento) LIKE :nro_documento',
          { :nro_documento => "%"+nro_documento.downcase+"%"} ]
    }
  }
  named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
          { :nombre => "%"+nombre.downcase+"%"} ]
    }
  }
  named_scope :by_tipo_documento_id, lambda do |tipo_documento_id|
    {
      :conditions => ['tipo_documento_id= ?' , tipo_documento_id]
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
      builder.by_nombre(options[:nombre]) unless options[:nombre].blank?
      builder.by_nro_documento(options[:nro_documento]) unless options[:nro_documento].blank?
       builder.by_tipo_documento_id(options[:tipo_documento_id]) unless options[:tipo_documento_id].blank?
      #builder.by_consultorio

    end
  end

  def self.buscar(options)
      scope_builder do |builder|
       builder.by_nro_documento(options[:nro_documento]) unless options[:nro_documento].blank?
      end
  end
  
end
