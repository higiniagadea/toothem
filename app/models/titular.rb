
class Titular < ActiveRecord::Base
  has_many :pacientes
  
  belongs_to :obra_social

 #validates
   validates_presence_of :nombre, :message => ', debe ingresar un nombre'
   validates_presence_of :obra_social_id => 'debe ingresar una obra social'
   validates_presence_of :matricula => 'debe ingresar una matrícula'
   #validates_uniqueness_of :matricula, :scope => [:consultorio, :obra_social_id], :message => "ya se encuentra cargado el titular para la obra social"
   

#scope_builder
    named_scope :by_nombre, lambda { |nombre|
    {
      :conditions=> ['lower(nombre) LIKE :nombre ',
                     { :nombre => "%"+nombre.downcase+"%"} ]
    }
  }
  named_scope :by_matricula, lambda { |matricula|
    {
      :conditions=> ['lower(matricula) LIKE :matricula ',
                     { :matricula => "%"+matricula.downcase+"%"} ]
    }
  }
  named_scope :by_obra_social_id, lambda { |obra_social_id|
    {
    :conditions => ['obra_social_id = :obra_social_id',
                    {:obra_social_id => obra_social_id}]
    }
  }
  named_scope :limitar, :limit => 15
  def self.basic_search(options)
    scope_builder do |builder|
      
        builder.by_matricula(options[:matricula]) if options[:matricula]
        builder.by_nombre(options[:nombre]) if options[:nombre]
        builder.limitar   
    end
  end
  def self.basic_search_in_pacientes(options)
    scope_builder do |builder|
        builder.by_matricula(options[:matricula]) if options[:matricula]
        builder.by_nombre(options[:nombre]) if options[:nombre]
        builder.by_obra_social_id(options[:get][:obra_social_id]) if options[:get][:obra_social_id]
    end
  end

end
