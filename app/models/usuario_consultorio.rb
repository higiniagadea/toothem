class UsuarioConsultorio < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :consultorio
end
