class Profesional < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :estado_laboral
  belongs_to :tipo_documento
  belongs_to :consultorio
  has_many :tareas
  has_many :turnos
  has_many :tratamientos,  :dependent => :destroy

  validates_presence_of :nombre, :message=>' requerido'
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ' inválido'

  named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
          { :nombre => "%"+nombre.downcase+"%"} ]
    }
  }

 named_scope :by_nro_documento, lambda { |nro_documento|
    {
      :conditions=> ['lower(nro_documento) LIKE :nro_documento',
          { :nro_documento => "%"+nro_documento.downcase+"%"} ]
    }
  }



  def self.basic_search(options)

    scope_builder do |builder|

        builder.by_nombre(options[:nombre]) if options[:nombre]
       builder.by_nro_documento(options[:nro_documento]) if options[:nro_documento]
       
    end
  end

end
