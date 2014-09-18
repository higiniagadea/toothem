class ProfesionalesController < ApplicationController

  before_filter :generar_submenus, :login_required
  layout 'default'

  def index
    #@profesionales = Profesional.paginate :page=> params[:page], :conditions => ['consultorio_id in (?)', current_usuario.consultorios], :per_page=>15, :order=> 'nombre ASC'
    #@profesionales = Profesional.find(:all,:conditions => ['consultorio_id in (?)', current_usuario.consultorios])
    @profesionales = Profesional.paginate :page=> params[:page], :per_page => 10   
    respond_to do |format|
    format.html {render :layout => 'default'}      
    end
  end

  def show   
    @profesional = Profesional.find(params[:id])   
    respond_to do |format|    
      format.html{ render :layout => false}
    end
  end

  def new    
    @profesional = Profesional.new
    respond_to do |format|      
      format.html  { render :layout => 'default' }
    end
  end

 
  def edit  
    @profesional = Profesional.find(params[:id])
    respond_to do |format|
      format.html {render :layout => 'default'}
    end
  end

  def create   
    #params[:profesional][:consultorio_id]= current_usuario.consultorios
    @profesional = Profesional.new(params[:profesional])
    respond_to do |format|
      if @profesional.save
        flash[:notice] = 'Profesional registrado.'
        format.html { redirect_to buscar_profesionales_path }       
      else
        format.html { render :action => "new" }        
      end
    end
  end

  
  def update  
    @profesional = Profesional.find(params[:id])
    respond_to do |format|
      if @profesional.update_attributes(params[:profesional])
        flash[:notice] = 'Profesional actualizado.'
        format.html { redirect_to buscar_profesionales_path }       
      else
        format.html { render :action => "edit" }       
      end
    end
  end

  
  def destroy
    @profesional = Profesional.find(params[:id])
      unless @profesional.tareas.blank? || unless @profesional.turnos.blank? 
      flash[:error] = "Imposible eliminar el profesional ya que posee registros asociados"
      else
      flash[:notice] = 'Profesional eliminado'
      @profesional.destroy
      end  
      end
    respond_to do |format|
      if !@tratamiento.blank?
        @profesional.destroy
         flash[:notice] = 'Profesional eliminado'
         format.html { redirect_to buscar_profesionales_path }
      else
         flash[:error] = "Imposible eliminar el profesional ya que posee registros asociados"
         format.html { redirect_to buscar_profesionales_path }
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
      if params[:nombre].blank?
       format.html {render :text => '<span style="color:red"> Ingrese un nombre del profesional para realizar la busqueda</span> '}
      elsif       
       @profesionales = Profesional.basic_search(params).paginate(:page => params[:page], :per_page=> 10, :order => 'nombre ASC')
        format.html {render :partial => 'resultado', :layout => false}
      end
    end
  end


  def verificar_documento
   @profesional = Profesional.find(:first, :conditions => {:nro_documento => params[:profesional][:nro_documento]})
    respond_to do |format|
    format.json { render :json => !@profesional}
    end
  end
 
end
