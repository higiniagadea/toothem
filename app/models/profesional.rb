class Profesional < ActiveRecord::Base
  belongs_to :estado_laboral
  belongs_to :tipo_documento
  belongs_to :consultorio

  has_many :tratamientos
  has_many :fichas
  #has_many :tratamientos

  validates_presence_of :nombre, :message=>' requerido'
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ' inválido'

  named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
          { :nombre => "%"+nombre.downcase+"%"} ]
    }
  }

  named_scope :by_documento, lambda { |documento|
    {
      :conditions => ['lower(documento) LIKE :documento',
        { :documento => "%"+documento.downcase+"%"} ]
    }
  }



  def self.basic_search(options)

    scope_builder do |builder|

        builder.by_nombre(options[:nombre]) if options[:nombre]
        builder.by_documento(options[:documento]) if options[:documento]
       
    end
  end

end
