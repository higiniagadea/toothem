class ConsultoriosController < ApplicationController
  # GET /consultorios
  # GET /consultorios.xml
  layout 'default'
  before_filter :login_required
  def index
    @pagetitle = "Consultorios"
    @consultorios = Consultorio.paginate :page=> params[:page], :per_page=>5, :order=> 'nombre ASC'
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultorios }
    end
  end

  # GET /consultorios/1
  # GET /consultorios/1.xml
  def show
    @consultorio = Consultorio.find(params[:id])
   
    @consultorios = Consultorio.paginate :page=> params[:page], :per_page=>5, :order=> 'nombre ASC'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consultorio }
    end
  end

  # GET /consultorios/ne
  # GET /consultorios/new.xml
  def new
    @pagetitle = "Nuevo consultorio"
    @consultorio = Consultorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consultorio }
    end
  end

  # GET /consultorios/1/edit
  def edit
    @pagetitle = "Editar consultorio"
    @consultorio = Consultorio.find(params[:id])
  end

  # POST /consultorios
  # POST /consultorios.xml
  def create
    @consultorio = Consultorio.new(params[:consultorio])

    respond_to do |format|
      if @consultorio.save
        flash[:notice] = 'Consultorio creado.'
        format.html { redirect_to(consultorios_url) }
        
      else
        @pagetitle = "Nuevo consultorio"
        format.html { render :action => "new" }
        
      end
    end
  end

  # PUT /consultorios/1
  # PUT /consultorios/1.xml
  def update

    @consultorio = Consultorio.find(params[:id])

    respond_to do |format|
      if @consultorio.update_attributes(params[:consultorio])
        flash[:notice] = 'Consultorio actualizado.'
        format.html { redirect_to(consultorios_url) }
        
      else
        @pagetitle = "Editar consultorio"
        format.html { render :action => "edit" }
        
      end
    end
  end

  # DELETE /consultorios/1
  # DELETE /consultorios/1.xml
  def destroy
    @consultorio = Consultorio.find(params[:id])
    @paciente = Paciente.find(:first, :conditions => ['consultorio_id = ?', params[:id]])
    @profesional = Profesional.find(:first, :conditions => ['consultorio_id = ?', params[:id]])
    @titular = Titular.find(:first, :conditions => ['consultorio_id = ?', params[:id]])
    #@usuario = Usuario.find(:first, :conditions => ['consultorio_id = ?', params[:id]])
    respond_to do |format|
      if @paciente.blank? && @profesional.blank? && @titular.blank?
        @consultorio.destroy
        flash[:notice] = "Consultorio Eliminado"
        format.html { redirect_to(consultorios_url) }
      else
        flash[:error] = "Imposible eliminar el consultorio ya que posee registros asociados"
        format.html { redirect_to(consultorios_url) }

      end
  end
 
  end
end
