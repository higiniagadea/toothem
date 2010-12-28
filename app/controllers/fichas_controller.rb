  class FichasController < ApplicationController
  # GET /fichas
  # GET /fichas.xml

  before_filter :login_required
    layout 'default'


  def index

    @pagetitle = "Fichas"
    @fichas = Ficha.paginate :page=> params[:page], :per_page=> 5
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :partial => 'listado' }
    end
  end

  # GET /fichas/1
  # GET /fichas/1.xml
 def show
    @ficha = Ficha.find(params[:id])
    respond_to do |format|
   
      format.html { render :layout => false }
    end
  end

  # GET /fichas/new
  # GET /fichas/new.xml
  def new
    #@tratamiento = Tratamiento.new
    @paciente = Paciente.find(params[:paciente_id])
    @ficha = Ficha.new

    respond_to do |format|
      format.html{render :layout => false }
      
      end
   end
 
  # GET /fichas/1/edit
  def edit
    #@ficha = Ficha.find(params[:ficha_id]) unless params[:ficha_id].blank?
    if params[:paciente_id]
      @paciente = Paciente.find(params[:paciente_id])
    end
    @ficha = Ficha.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false }
    end
  end

  # POST /fichas
  # POST /fichas.xml
  def create
    @paciente = Paciente.find(params[:ficha][:paciente_id])
    @ficha = Ficha.new(params[:ficha])
    @ficha.obra_social_id = @paciente.titular.obra_social_id
    @ficha.localidad_id = @paciente.localidad_id
    @ficha.paciente_id = @paciente.id
     respond_to do |format|
      if @ficha.save
       format.html {redirect_to edit_paciente_path(@paciente) + '#tratamientos'}
       flash[:notice] = 'Ficha creada'
      else
         format.html { render :action => "new" }
         format.xml  { render :xml => @fichas.errors, :status => :unprocessable_entity }
     end

    end
  end

  # PUT /fichas/1
  # PUT /fichas/1.xml
  def update
    
     @ficha = Ficha.find(params[:id])
     @paciente = Paciente.find(params[:ficha][:paciente_id])
    respond_to do |format|
      if @ficha.update_attributes(params[:ficha])
       #@tratamiento.update_attribute(params[:tratamiento])
        flash[:notice] = 'Ficha actualizada.'
        format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }
        format.xml  { head :ok }
     else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichas/1
  # DELETE /fichas/1.xml
  def eliminar
    @ficha = Ficha.find(params[:id])
    @ficha.destroy
    @paciente = Paciente.find(params[:paciente_id])
    respond_to do |format|
      flash[:notice] = 'Tratamiento eliminado'
      format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }
  
    end
  end

  def buscar
    @pagetitle = "Buscar Ficha"
    respond_to do |format|
      format.html {render :layout=> false}

    end
  end

  def resultado
    @profesionales = Profesional.find(params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]
    params[:ficha][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id]
    respond_to do |format|
      params[:ficha][:profesional_id] =  @profesionales.id
      if params[:profesional][:profesional_id].blank? && params[:fecha].blank?
        format.html{render :text => "Ingrese los datos para realizar la busqueda", :layout => false }
      else
       @fichas = Ficha.buscar(params[:ficha])
        format.html {render :partial => 'resultado', :layout => false}
      end

  end
  end

  def ver
  
  @ficha = Ficha.find_by_id(params[:id], :include => 'tratamientos')

  respond_to do |format|
    format.html {render :partial => 'ver', :layout => false}
   end
  end

  
  def imprimir
    @ficha = Ficha.find_by_id(params[:id], :include => 'tratamientos')
      respond_to do |format|
        format.html{ render :partial => 'imprimir' }
      end
  end

end
