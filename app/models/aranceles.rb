class Aranceles < ActiveRecord::Base
  belongs_to :prestacion
  belongs_to :obra_social
end
