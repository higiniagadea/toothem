class ClinicasController < ApplicationController
  # GET /clinicas
  # GET /clinicas.xml
  
  layout 'default'
  before_filter  :generar_submenus
  before_filter :login_required
  
  def index
    
    @clinicas = Clinica.paginate :page=> params[:page], :per_page=> 10, :order=> 'nombre ASC'

    respond_to do |format|
      format.html # index.html.erb
      
    end
  end

  # GET /clinicas/1
  # GET /clinicas/1.xml
  def show
    @clinica = Clinica.find(params[:id])

    respond_to do |format|
    
      format.html { render :layout => false }
    end
  end

  # GET /clinicas/new
  # GET /clinicas/new.xml
  def new
    
    @clinica = Clinica.new

    respond_to do |format|
     
      format.html{render :layout => false}
    end
  end

  # GET /clinicas/1/edit
  def edit    
    @clinica = Clinica.find(params[:id])

    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /clinicas
  # POST /clinicas.xml
  def create
   
    @clinica = Clinica.new(params[:clinica])

    respond_to do |format|
      if @clinica.save
        flash[:notice] = 'Clinica creada.'
        format.html { redirect_to buscar_clinicas_url }
     
      else
        format.html { render :action => "new" }
      
      end
    end
  end

  # PUT /clinicas/1
  # PUT /clinicas/1.xml
  def update
    @clinica = Clinica.find(params[:id])
   
    respond_to do |format|
      if @clinica.update_attributes(params[:clinica])
        flash[:notice] = 'Clinica actualizada.'
        format.html { redirect_to search_clinicas_url }
       
      else
        format.html { render :action => "edit" }
        
      end
    end
  end

  # DELETE /clinicas/1
  # DELETE /clinicas/1.xml
  def destroy
    @clinica = Clinica.find(params[:id])
    respond_to do |format|
      if @clinica.consultorios.blank?
        @clinica.destroy
        flash[:notice] = 'Clinica eliminada.'

      else
        flash[:error] = 'Imposible eliminar la clínica ya que posee consultorios asociados'
      end
      format.html { redirect_to search_clinicas_url }
     
    end
  end


  def buscar
   respond_to do |format|
      format.html
  end
  end

    def resultado

    respond_to do |format|
        @clinicas = Clinica.basic_search(params).paginate :page => params[:page], :per_page => 10

        format.html {render :partial => 'resultado', :layout => false }

      end
  end

  end
