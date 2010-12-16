class PrestacionesController < ApplicationController
  # GET /prestaciones
  # GET /prestaciones.xml
  layout 'default'
 before_filter :login_required
  def index
 @prestaciones = Prestacion.paginate :page=> params[:page], :per_page=> 2
   
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
      
      format.html  { render :layout => false }
    end
  end

  # GET /prestaciones/new
  # GET /prestaciones/new.xml
  def new
    @prestacion = Prestacion.new
   
    respond_to do |format|
    
      format.html  { render :layout=> 'default' }
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
        format.html { redirect_to prestaciones_path }
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
        format.html { redirect_to prestaciones_path }
        
      else
        format.html { render :action => "edit" }
        
      end
    end
  end

  # DELETE /prestaciones/1
  # DELETE /prestaciones/1.xml
  def destroy
    @prestacion = Prestacion.find(params[:id])
    @prestacion.destroy

    respond_to do |format|
      format.html { redirect_to(prestaciones_url) }
      format.xml  { head :ok }
    end
  end

  

  


  def buscar
    @pagetitle = "Buscar Prestaciones"
    respond_to do |format|
      format.html 
    end
  end


  def resultado
    
    respond_to do |format|     
        @prestaciones = Prestacion.basic_search(params)
        
        format.html {render :partial => 'resultado', :layout => false }
        @prestaciones = @prestaciones.paginate :page => params[:page], :per_page => 2
      end
  end

 def verificar_codigo
  @prestacion = Prestacion.find(:first, :conditions => {:codigo => params[:prestacion][:codigo]})
    respond_to do |format|


    format.json { render :json => !@prestacion}
    end
  end




end