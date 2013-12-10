class Imagen < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :archivo
  has_one :db_file
  #validates

  validates_presence_of :archivo, :message => 'Seleccione un Archivo'
  validates_presence_of :descripcion, :observaciones, :message => ' no debe estar vacío'

  
 
end
