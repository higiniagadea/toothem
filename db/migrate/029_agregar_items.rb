class AgregarItems < ActiveRecord::Migration
  def self.up
    #Item.create :nombre => 'root', :parent_id => 0
    Item.create :nombre => 'Pacientes', :url => "/pacientes/search", :parent_id => 1, :orden => 1, :estatico => true
      Item.create :nombre => 'Listado', :url => "/pacientes", :parent_id => 2, :orden => 1, :estatico => true
      Item.create :nombre => 'Nuevo', :url => "/pacientes/new", :parent_id => 2, :orden => 2, :estatico => true

    Item.create :nombre => 'Profesionales', :url => "/profesionales", :parent_id => 1, :orden => 1, :estatico => true
      Item.create :nombre => 'Buscar', :url => "/profesionales", :parent_id => 2, :orden => 2, :estatico => true
      Item.create :nombre => 'Nuevo', :url => "/profesionales/new", :parent_id => 2, :orden => 1, :estatico => true

    Item.create :nombre => 'Obras_Sociales', :url => "/obras_sociales", :parent_id => 1, :orden => 1, :estatico => true
      Item.create :nombre => 'Buscar', :url => "/obras_sociales/buscar", :parent_id => 2, :orden => 1, :estatico => true
      Item.create :nombre => 'Nuevo', :url => "/obras_sociales/new", :parent_id => 2, :orden => 2, :estatico => true

    Item.create :nombre => 'Clinicas', :url => "/clinicas", :parent_id => 1, :orden => 1, :estatico => true
      Item.create :nombre => 'Nuevo', :url => "/clinicas/new", :parent_id => 2, :orden => 2, :estatico => true

    Item.create :nombre => 'Logout', :url => "/logout", :parent_id => 1, :orden => 1, :estatico => true
  end
  

end