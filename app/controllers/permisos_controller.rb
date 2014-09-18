class PermisosController < ApplicationController
   
 #before_filter :login_required
 layout 'default'
 
  def index
 @permisos = Permiso.paginate :page=> params[:page], :per_page=> 10   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @permisos }
    end
  end

  # GET /prestaciones/1
  # GET /prestaciones/1.xml
  def show
   @permiso  = Permiso.find(params[:id])    
    respond_to do |format|
      format.html{ render :layout => false }
    end
  end

  # GET /prestaciones/new
  # GET /prestaciones/new.xml
  def new
    @permiso = Permiso.new   
    respond_to do |format|    
      format.html  { render :layout=> 'default' }
    end
  end

 
  def edit
    @permiso = Permiso.find(params[:id]) 
    respond_to do |format|
    format.html {render :layout => false}
    end
  end
  
  def create
    @permiso = Permiso.new(params[:permiso])    
    respond_to do |format|
      if @permiso.save
        flash[:notice] = 'Permiso registrada.'
        format.html { redirect_to new_permiso_path }      
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @permiso.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @permiso = Permiso.find(params[:id])    
    respond_to do |format|
      if @permiso.update_attributes(params[:permiso])
        flash[:notice] = 'Permiso actualizado'
        format.html { redirect_to new_permiso_path }        
      else
        format.html { render :action => "edit" }        
      end
    end
  end

 
  def destroy
    @permiso= Permiso.find(params[:id])
      respond_to do |format|
       if !@perfil.blank?
        @permiso.destroy
        flash[:notice] = 'Permiso eliminado'
        format.html { redirect_to new_permiso_url }
       else
        flash[:error] = 'No se puede eliminar el permiso'
        format.html { redirect_to new_permiso_url }
       end
      end
  end

end