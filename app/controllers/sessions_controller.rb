# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
 
    layout 'default'
  # render new.rhtml
  def new
    respond_to do |format|
     unless current_usuario.blank? ? format.html : format.html {redirect_to search_pacientes_path}
    end
    end
  end

  def create
    logout_keeping_session!
    usuario = Usuario.authenticate(params[:login], params[:password])
    if usuario
   
      self.current_usuario = usuario
      new_cookie_flag = (params[:remember_me] == "1")

      session[:consultorio] = Consultorio.find(:first, :conditions => ['id in (?)', current_usuario.consultorios])
      session[:user_menu] = Item.find(:all, :conditions => 'parent_id = 1', :order => 'orden')

      paciente = Item.find(:first,:conditions => ["url = ?", '/pacientes'])
      params[:item_selected] = paciente
      generar_submenus

      #session[:subitems] = Item.find(:all, :conditions => "lower(url) LIKE '%/profesionales/%'")

      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/pacientes/search')
      flash[:notice] = "Ingreso correcto"

    else
     
      note_failed_signin
      @login = params[:login]
      @remember_me = params[:remember_me]
    
      render :action => 'new'
      
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Se ha desconectado."
    redirect_back_or_default('/login')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    
    flash[:error] = "Los datos ingresados son incorrectos"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"

  end
end
