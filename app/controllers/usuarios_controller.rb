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
    logout_keeping_session!

    @usuario = Usuario.new(params[:usuario])
    success = @usuario && @usuario.save

    if success && @usuario.errors.empty?
      
      self.current_usuario = @usuario # !! now logged in
      redirect_back_or_default('/usuarios/buscar')
      # flash[:notice] = "Se le ha enviado un email con los pasos a seguir para su cambio de clave. Verifique su casilla de correo."
        flash[:notice] = 'Usuario creado'
      else
         #self.current_usuario = @usuario
       flash[:error] = 'Verifique su contraseña'
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
       @usuarios = Usuario.buscar(params).paginate(:page => params[:page], :per_page=> 10, :order => 'name ASC')
        format.html {render :partial => 'resultado', :layout => false}
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


  end

  def resetear_clave   
    #@usuario = Usuario.find_by_email(params[:usuario][:email])

    current_usuario.id =  params[:usuario_id]
    @usuario = Usuario.find(params[:id])

    if @usuario
      if @usuario.login == params[:usuario][:login]
        @usuario[:linkhash] = self.generar_linkhash(@usuario)
        Notificador.create_cambio_de_clave(@usuario)
        Notificador.deliver_cambio_de_clave(@usuario) # sends the email
        flash[:notice] = "Se le ha enviado un email con los pasos a seguir para su cambio de clave. Verifique su casilla de correo."

        redirect_to('/session/new')

      else
        flash[:error] = "Nombre de usuario incorrecto"
        render :action => 'olvide_mi_clave'
      end

    else
      flash[:error] = "El email no corresponde al usuario ingresado"
      render :action => 'olvide_mi_clave'
    end

  end


 
  def cambiar_clave
    current_usuario.id =  params[:id]
    @usuario = Usuario.find(params[:id])
    
    if(!@usuario.blank?)
      hash_usuario = self.generar_linkhash(@usuario)

      if hash_usuario == params[:hash]
        newpassword = self.newpass(6)


        if @usuario.update_attribute(:password, newpassword) && @usuario.update_attribute(:cambio_clave, "1")

          @usuario[:newpassword] = newpassword
          Notificador.create_envio_clave_nueva(@usuario)
          Notificador.deliver_envio_clave_nueva(@usuario) # sends the email
          flash[:notice] = "Se le ha enviado un email con sus nuevas credenciales de acceso. Verifique su casilla de correo."
          redirect_to('/ingresar')
        else
          flash[:error] = "No se ha podido cambiar cu clave debido a un error interno. Pongase en contacto con el administrador del sistema"
          
        end

        #cambio de clave

      else
        flash[:error] = "Su email de cambio de clave ha caducado. Solicite un nuevo cambio de clave"
        
      end
    else
      redirect_to('/')
    end


  end

 def enviar_mail
   
    @usuario = Usuario.find_by_email(params[:usuario][:email])

   
        newpassword = self.newpass(6)
        
       if @usuario.update_attribute(:password, newpassword)
          @usuario[:newpassword] = newpassword
          Notificador.create_envio_clave_nueva(@usuario)
          Notificador.deliver_envio_clave_nueva(@usuario) # sends the email
          flash[:notice] = "Se le ha enviado un email para reactivar su contraseña"
          redirect_to('/session/new')
        else
          
          flash[:notice] = "No se ha podido cambiar cu clave debido a un error interno. Pongase en contacto con el administrador del sistema"
          redirect_to('/session/new')
        end
    
 end


  def renovar_clave
    @usuario = Usuario.new
    respond_to do |format|
      format.html
    end
  end

  def establecer_nueva_clave
    if Usuario.authenticate(current_usuario.login, params[:clave_anterior])
      if ((params[:clave_nueva] == params[:confirma_clave_nueva]) && !params[:confirma_clave_nueva].blank?)
          current_usuario.password_confirmation = params[:confirma_clave_nueva]
          current_usuario.password = params[:clave_nueva]

          if current_usuario.save!
              current_usuario.update_attribute(:cambio_clave, nil)
              flash[:notice] = "Clave cambiada correctamente"
              redirect_to renovar_clave_usuarios_path
          else
              flash[:error] = "La clave no ha podido modificarse debido a un error interno"
              render :action => 'renovar_clave'
          end

      else
          flash[:error] = "Clave nueva y confirmaci&oacute;n no coinciden"
          render :action => 'renovar_clave'
      end
    else
        flash[:error] = "Clave anterior incorrecta"
        render :action => 'renovar_clave'
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
