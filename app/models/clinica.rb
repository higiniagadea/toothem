class Clinica < ActiveRecord::Base
  has_many :consultorios

  validates_presence_of :nombre, :message => ' requerido'

  named_scope :by_nombre, lambda { |nombre|
    {:conditions=> ['lower(nombre) LIKE :nombre',
      {:nombre => "%"+nombre.downcase+"%"}]
    }
  }



  def self.basic_search(options)
    scope_builder do |builder|
      builder.by_nombre(options[:nombre]) if options[:nombre]

    end
  end
  
end
