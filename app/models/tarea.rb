class Tarea < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :profesional

end
