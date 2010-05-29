class Profesional < ActiveRecord::Base
  belongs_to :estado_laboral
  belongs_to :tipo_documento
  belongs_to :consultorio


  has_many :fichas
  #has_many :tratamientos

  validates_presence_of :nombre, :message=>' requerido'
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ' inválido'


end
