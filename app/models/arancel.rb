class Arancel < ActiveRecord::Base
  belongs_to :prestacion
  belongs_to :obra_social

  
  #validates
  validates_inclusion_of :importe_cubierto, :in => 0.01..99999.99, :message => ', debe estar entre 0.01 y 99999.99'
  validates_numericality_of :coseguro, :greater_than_or_equal_to => 0, :mesage => 'El valor debe ser mayor o igual a cero'
  validates_presence_of :prestacion_id,:obra_social_id,:importe_cubierto,:coseguro, :message => ', no debe estar vacío'
  validates_uniqueness_of :prestacion_id, :scope => [:obra_social_id], :message => ', debe ser único en esta obra social'
end
