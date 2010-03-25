class Perfil < ActiveRecord::Base
validates_presence_of :nombre, :message=>"Debe ingresar un nombre"
end
