class ObrasSocialesController < ApplicationController
  # GET /obras_sociales
  # GET /obras_sociales.xml
  layout 'default'
  before_filter  :generar_submenus, :login_required
  def index
    
  #  @obras_sociales = ObraSocial.find(:all,:conditions => ['consultorio_id in (?)', current_usuario.consultorios])
    @obras_sociales = ObraSocial.paginate :page=> params[:page], :per_page=> 10, :order => 'nombre ASC'
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @obras_sociales }
    end
  end
  # GET /obras_sociales/1
  # GET /obras_sociales/1.xml
  def show
    @obra_social = ObraSocial.find(params[:id])
    respond_to do |format|
    
      format.html  { render :layout => false}
    end
  end

  # GET /obras_sociales/new
  # GET /obras_sociales/new.xml
  def new
    @obra_social = ObraSocial.new
     respond_to do |format|
      format.html {render :layout => false}
    end
    
  end

  # GET /obras_sociales/1/edit
  def edit
    @obra_social = ObraSocial.find(params[:id])
  
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /obras_sociales
  # POST /obras_sociales.xml
  def create
    #params[:obra_social][:consultorio_id] = current_usuario.consultorio_id
    @obra_social = ObraSocial.new(params[:obra_social])
    @pagetitle = "Nueva obra social"
    respond_to do |format|
      if @obra_social.save
        flash[:notice] = 'Obra Social creada.'
        format.html { redirect_to obras_sociales_path}
        
      else
        format.html { render :action => "new" }
        
      end
    end
  end

  # PUT /obras_sociales/1
  # PUT /obras_sociales/1.xml
  def update
    @obra_social = ObraSocial.find(params[:id])
  
    respond_to do |format|
      if @obra_social.update_attributes(params[:obra_social])
        flash[:notice] = 'Obra Social actualizada'
        format.html { redirect_to obras_sociales_path }
        
      else
        format.html { render :action => "edit" }
       
      end
    end
  end

  # DELETE /obras_sociales/1
  # DELETE /obras_sociales/1.xml
  def destroy
      @obra_social = ObraSocial.find(params[:id])
      @titular = Titular.find_by_obra_social_id(@obra_social.id)
    
    respond_to do |format|
      if @titular.blank?
       @obra_social.destroy
       
       flash[:notice] = 'Obra Social eliminada'
       format.html { redirect_to obras_sociales_path}
       
       
      else
         flash[:notice] = 'No se puede eliminar la Obra Social, ya que hay operaciones  asociadas a la misma'
         format.html { redirect_to(obras_sociales_url) }
      end
    end
   end

  def buscar
   
    respond_to do |format|
      format.html # buscar.html.erb

    end
  end
  def resultado
    respond_to do |format|      
        @obras_sociales = ObraSocial.basic_search(params).paginate :page => params[:page], :per_page => 10, :order => 'nombre ASC'
        format.html {render :partial => 'resultado', :layout => false }
      end
          
    end 


end
