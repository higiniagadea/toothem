class Titular < ActiveRecord::Base
  has_many :pacientes

  belongs_to :obra_social
end
