class Prestacion < ActiveRecord::Base


  belongs_to :consultorio
  has_many :obras_sociales, :through => :aranceles
  belongs_to :tratamiento

  #validates
  validates_presence_of :codigo, :message => ', ya existe en los registros'
  validates_presence_of :descripcion, :message => 'ingrese una descripcion'

  def codigo_descripcion
    "#{codigo} - #{descripcion}"
  end

  named_scope :by_codigo, lambda { |codigo|
    {:conditions=> ['lower(codigo) LIKE :codigo',
      {:codigo => "%"+codigo.downcase}]
    }
  }

  named_scope :by_descripcion, lambda { |descripcion|
    {
      :conditions=> ['lower(descripcion) LIKE :descripcion',
        {:descripcion => "%"+descripcion.downcase+"%"}]
    }

  }

  def self.basic_search(options)
    scope_builder do |builder|
      builder.by_codigo(options[:codigo]) if options[:codigo]
      builder.by_descripcion(options[:descripcion]) if options[:descripcion]
    end
  end

end
