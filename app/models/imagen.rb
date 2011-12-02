class Imagen < ActiveRecord::Base
  belongs_to :paciente,  :dependent => :delete
  belongs_to :archivo,  :dependent => :delete
  has_one :db_file
  #validates

  validates_presence_of :archivo, :message => 'Seleccione un Archivo'
  validates_presence_of :descripcion, :observaciones, :message => ' no debe estar vacío'

  
 
end
