class Clinica < ActiveRecord::Base
  has_many :consultorios

  validates_presence_of :nombre, :message => ' requerido'

  named_scope :by_nombre, lambda { |nombre|
    {:conditions=> ['lower(nombre) LIKE :nombre',
      {:nombre => "%"+nombre.downcase+"%"}]
    }
  }

   named_scope :by_direccion, lambda { |direccion|
    {:conditions=> ['lower(direccion) LIKE :direccion',
      {:direccion => direccion.downcase}]
    }
  }


   named_scope :by_cuit, lambda { |cuit|
    {:conditions=> ['lower(cuit) LIKE :cuit',
      {:cuit => cuit.downcase}]
    }
  }







  def self.basic_search(options)
    scope_builder do |builder|
      builder.by_nombre(options[:nombre]) unless options[:nombre].blank?
      builder.by_direccion(options[:direccion]) unless options[:direccion].blank?
      builder.by_ciut(options[:cuit]) unless options[:cuit].blank?
    end
  end
  
end
