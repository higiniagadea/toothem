class AgregarItems < ActiveRecord::Migration
  def self.up
    Item.create :nombre => 'root', :parent_id => 0
      Item.create :nombre => 'Pacientes', :url => "/pacientes/search", :parent_id => 1, :orden => 2, :estatico => true
        paciente = Item.find(:first, :conditions => "nombre like 'Pacientes'")
          Item.create :nombre => 'Listado', :url => "/pacientes", :parent_id => paciente.id, :orden => 1, :estatico => true, :url_imagen => "report_user.png"
          Item.create :nombre => 'Nuevo', :url => "/pacientes/new", :parent_id => paciente.id, :orden => 2, :estatico => true, :url_imagen => "add.png"

      Item.create :nombre => 'Profesionales', :url => "/profesionales", :parent_id => 1, :orden => 1, :estatico => true
        profesional = Item.find(:first, :conditions => "nombre like 'Profesionales'")
          Item.create :nombre => 'Buscar', :url => "/profesionales", :parent_id => profesional.id, :orden => 2, :estatico => true, :url_imagen => "magnifier_zoom_in.png"
          Item.create :nombre => 'Nuevo', :url => "/profesionales/new", :parent_id => profesional.id, :orden => 1, :estatico => true, :url_imagen => "add.png"

      Item.create :nombre => 'Obras_Sociales', :url => "/obras_sociales", :parent_id => 1, :orden => 3, :estatico => true
        obra_social = Item.find(:first, :conditions => "nombre like 'Obras_Sociales'")
          Item.create :nombre => 'Buscar', :url => "/obras_sociales/buscar", :parent_id => obra_social.id, :orden => 1, :estatico => true, :url_imagen => "magnifier_zoom_in.png"
        Item.create :nombre => 'Nuevo', :url => "/obras_sociales/new", :parent_id => obra_social.id, :orden => 2, :estatico => true, :url_imagen => "add.png"

    

      Item.create :nombre => 'Logout', :url => "/logout", :parent_id => 1, :orden => 100, :estatico => true

      
  end

 
end