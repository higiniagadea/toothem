class SaldoPaciente < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :paciente
  has_many :periodos
end