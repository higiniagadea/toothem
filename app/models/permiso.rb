class Permiso < ActiveRecord::Base
  belongs_to :item
  belongs_to :perfil
end
