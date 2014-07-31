class UsuariosController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
 
  #before_filter :login_required
  layout 'default'
  # render new.rhtml
  def new
    @usuario = Usuario.new
    render :layout => "default"
 
  end
 
  def create
    #logout_keeping_session!
    params
    @usuario = Usuario.new(params[:usuario])
 
    success = @usuario && @usuario.save

    if success && @usuario.errors.empty?

      redirect_back_or_default('/usuarios/buscar')
      flash[:notice] = 'Usuario Registrado'
      self.current_usuario = @usuario
      
    else
      render :action => 'new'     
    end
   
  end




   def show
    @usuario = Usuario.find(params[:id])
    respond_to do |format|

      format.html { render :layout => false}
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end




   def update
     
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        
        flash[:notice] = 'Usuario actualizado.'
        format.html { redirect_to buscar_usuarios_path  }

      else
        format.html { render :action => "edit" }
       
      end
    end
  end

  def buscar
    respond_to do |format|
      format.html
    end
  end

  def resultado
   respond_to do |format|
      if params[:login].blank? 
           format.html{render :text => '<span style="color:red">Ingrese al menos un dato para realizar la b&uacute;squeda </span>' }
       else
       @usuarios = Usuario.buscar(params).paginate(:page => params[:page], :per_page=> 10, :order => 'login ASC')
        format.html {render :partial => 'resultado', :layout => false}
      end
    end
  end 

  def destroy
    @usuario= Usuario.find(params[:id])
    @usuario.destroy
    respond_to do |format|
      flash[:notice] = 'Usuario eliminado'
      format.html { redirect_to buscar_usuarios_path }

    end
  end

  def olvide_mi_clave
    respond_to do |format|
      format.html
    end
  end

 
 def enviar_email #envia el mail porq olvido la contraseña boton olvide mi contraseña afuera de la sesion
   
    @usuario = Usuario.find_by_email(params[:usuario][:email])
    if @usuario
      if @usuario.login == params[:usuario][:login]
        @usuario[:linkhash] = self.generar_linkhash(@usuario)
      
        newpassword = self.newpass(6)

       if @usuario.update_attribute(:password, newpassword) 

          @usuario[:newpassword] = newpassword
        Notificador.create_cambio_de_clave(@usuario)
        Notificador.deliver_envio_clave_nueva(@usuario) # sends the email
        flash[:notice] = "Se le ha enviado un email con los pasos a seguir para su cambio de clave. Verifique su casilla de correo."

        redirect_to new_session_path

      else
        flash[:error] = "Nombre de usuario incorrecto"
        render :action => 'olvide_mi_clave'
      end

    else
      flash[:error] = "El email no corresponde al usuario ingresado"
      render :action => 'olvide_mi_clave'
    end

  end
   
 end




  def renovar_clave
    @usuario = Usuario.new
    respond_to do |format|
      format.html
    end
  end


  def verificar

    @usuario = Usuario.find(:first, :conditions => {:login => params[:usuario][:login]})
    respond_to do |format|

    format.json { render :json => !@usuario}

    end
  end

  def verificar_email

    @usuario = Usuario.find(:first, :conditions => {:email => params[:usuario][:email]})
    respond_to do |format|

    format.json { render :json => !@usuario}

    end
  end


 def  verificar_clave_email

    @usuario = Usuario.find(:first, :conditions => {:password => params[:usuario][:password]})
    respond_to do |format|

    format.json { render :json => !@usuario}

    end
 end

  def establecer_nueva_clave #dentro de la sesion
    params[:usuario_id]
    if Usuario.authenticate(current_usuario.login, params[:clave_anterior])
      if ((params[:clave_nueva] == params[:confirma_clave_nueva]) && !params[:confirma_clave_nueva].blank?)
          current_usuario.password_confirmation = params[:confirma_clave_nueva]
          current_usuario.password = params[:clave_nueva]

          if current_usuario.save!
              
              flash[:notice] = "Contraseña cambiada correctamente"
              redirect_to buscar_usuarios_path
          else
             redirect_to buscar_usuarios_path
              flash[:error] = "La contraseña no ha podido modificarse debido a un error interno"
             
          end

      else
        redirect_to buscar_usuarios_path
          flash[:error] = "Contraseña nueva y confirmaci&oacute;n no coinciden"
           
      end
    else
        
        redirect_to buscar_usuarios_path
        flash[:error] = "Contraseña anterior incorrecta"
    end
  end

  def verificar_clave
    respond_to do |format|
      format.json { render :json => Usuario.authenticate(current_usuario.login, params[:clave_anterior]) ? "true" : "false" }
    end
  end
  
  protected

  def generar_linkhash(usuario)
    fechas = usuario.created_at.to_s + usuario.updated_at.to_s
    linkhash = Digest::SHA1.hexdigest(fechas)

    linkhash
  end

  def newpass(len)
    chars = ("a".."z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    newpass
end

end
