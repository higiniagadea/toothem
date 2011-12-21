class Consultorio < ActiveRecord::Base
  has_many :profesionales

  has_many :prestaciones

  belongs_to :clinica
  has_many :pacientes
  validates_presence_of :nombre, :message => " requerido"

 has_and_belongs_to_many :usuarios,:join_table => 'usuarios_consultorios', :class_name => 'Usuario'


   named_scope :by_nombre, lambda { |nombre|
    {:conditions=> ['lower(nombre) LIKE :nombre',
      {:nombre => "%"+nombre.downcase+"%"}]
    }
  }





  def self.basic_search(options)
    scope_builder do |builder|
      builder.by_nombre(options[:nombre]) unless options[:nombre].blank?
 end
  end

end
