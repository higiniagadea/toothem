class PrestacionesController < ApplicationController
  # GET /prestaciones
  # GET /prestaciones.xml
  
 before_filter :login_required
 layout 'default'
 
  def index
 @prestaciones = Prestacion.paginate :page=> params[:page], :per_page=> 10
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prestaciones }
    end
  end

  # GET /prestaciones/1
  # GET /prestaciones/1.xml
  def show
   @prestacion = Prestacion.find(params[:id])
    
    respond_to do |format|
      
      format.html{ render :layout => false }
    end
  end

  # GET /prestaciones/new
  # GET /prestaciones/new.xml
  def new
    @prestacion = Prestacion.new
   
    respond_to do |format|
    
      format.html  { render :layout=> false }
    end
  end

  # GET /prestaciones/1/edit
  def edit
    @prestacion = Prestacion.find(params[:id])
 
    respond_to do |format|
    format.html {render :layout => false}
    end
  end
  # POST /prestaciones
  # POST /prestaciones.xml
  def create
    @prestacion = Prestacion.new(params[:prestacion])
    
    respond_to do |format|
      if @prestacion.save
        flash[:notice] = 'Prestacion creada.'
        format.html { redirect_to buscar_prestaciones_path }
        #format.xml  { render :xml => @prestacion, :status => :created, :location => @prestacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prestacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prestaciones/1
  # PUT /prestaciones/1.xml
  def update
    @prestacion = Prestacion.find(params[:id])
    
    respond_to do |format|
      if @prestacion.update_attributes(params[:prestacion])
        flash[:notice] = 'Prestacion actualizada'
        format.html { redirect_to buscar_prestaciones_path }
        
      else
        format.html { render :action => "edit" }
        
      end
    end
  end

  # DELETE /prestaciones/1
  # DELETE /prestaciones/1.xml
  def destroy
    @prestacion = Prestacion.find(params[:id])
    #@prestacion.destroy

    respond_to do |format|
      if !@obra_social.blank?
        @prestacion.destroy

      flash[:notice] = 'Prestacion eliminada'
      format.html { redirect_to buscar_prestaciones_url }
      else
       flash[:error] = 'Imposible eliminar la prestacion, ya que esta siendo referenciada por una Obra Social'
      format.html { redirect_to buscar_prestaciones_url }
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
        format.html{render :partial => 'resultado', :layout => false }
         @prestaciones = Prestacion.basic_search(params).paginate(:page => params[:page], :per_page => 10)
  
    end
  end

 def verificar_codigo
  @prestacion = Prestacion.find(:first, :conditions => {:codigo => params[:prestacion][:codigo]})
    respond_to do |format|


    format.json { render :json => !@prestacion}
    end
  end




end