class Item < ActiveRecord::Base
  acts_as_category
  

  validates_presence_of :nombre, :message=>"Debe ingresar un nombre"
  

  
  
end