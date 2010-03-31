class Perfil < ActiveRecord::Base
 has_many :permisos
 has_many :items, :through=> :permisos

  validates_presence_of :nombre, :message=>"Debe ingresar un nombre"
end
