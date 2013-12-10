# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def generar_submenus
     unless params[:item_selected].blank?
        @item = Item.find(params[:item_selected])
        session[:subitems] = Item.find(:all, :conditions => "lower(url) LIKE "+"'%"+@item.nombre.downcase+"%' AND url <> '"+ @item.url+ "'" , :order => 'orden')
        session[:subitems] = Item.find(:all, :conditions => "parent_id =" + @item.id.to_s + " AND activo =" + @item.activo.to_s, :order => 'orden')
     end
  end
end
