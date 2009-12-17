class Paciente < ActiveRecord::Base
  belongs_to :titular

  belongs_to :archivo

  has_many :fichas
  



  named_scope :by_matricula, lambda { |matricula|
    {
      :conditions=> ['lower(matricula) LIKE :matricula ',
          { :matricula => "%"+matricula.downcase+"%"} ]
    }
  }
  named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
          { :nombre => "%"+nombre.downcase+"%"} ]
    }
  }
  named_scope :by_consultorio, lambda { |consultorio|
    {
      :conditions => ['consultorio_id = :consultorio',
        { :consultorio => consultorio } ]
    }
  }


  def self.basic_search(options)
    scope_builder do |builder|

      builder.by_matricula(options[:matricula]) if options[:matricula]
      builder.by_nombre(options[:nombre]) if options[:nombre]
      #builder.by_consultorio

    end
  end


end