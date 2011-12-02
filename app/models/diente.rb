class Diente < ActiveRecord::Base
 belongs_to :odontograma,  :dependent => :delete
end
