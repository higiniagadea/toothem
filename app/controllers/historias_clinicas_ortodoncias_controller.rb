class HistoriasClinicasOrtodonciasController < ApplicationController
  # GET /historias_clinicas_ortodoncias
  # GET /historias_clinicas_ortodoncias.xml
  layout 'default'
  def index
    @historias_clinicas_ortodoncias = HistoriaClinicaOrtodoncia.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @historias_clinicas_ortodoncias }
    end
  end

  # GET /historias_clinicas_ortodoncias/1
  # GET /historias_clinicas_ortodoncias/1.xml
  def show
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @historia_clinica_ortodoncia }
    end
  end

  # GET /historias_clinicas_ortodoncias/new
  # GET /historias_clinicas_ortodoncias/new.xml
  def new
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @historia_clinica_ortodoncia }
    end
  end

  # GET /historias_clinicas_ortodoncias/1/edit
  def edit
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.find(params[:id])
  end

  # POST /historias_clinicas_ortodoncias
  # POST /historias_clinicas_ortodoncias.xml
  def create
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.new(params[:historia_clinica_ortodoncia])

    respond_to do |format|
      if @historia_clinica_ortodoncia.save
        flash[:notice] = 'Historia Clinica Ortodoncia creada.'
        format.html { redirect_to(@historia_clinica_ortodoncia) }
        format.xml  { render :xml => @historia_clinica_ortodoncia, :status => :created, :location => @historia_clinica_ortodoncia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @historia_clinica_ortodoncia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /historias_clinicas_ortodoncias/1
  # PUT /historias_clinicas_ortodoncias/1.xml
  def update
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.find(params[:id])

    respond_to do |format|
      if @historia_clinica_ortodoncia.update_attributes(params[:historia_clinica_ortodoncia])
        flash[:notice] = 'Historia Clinica Ortodoncia creada.'
        format.html { redirect_to(@historia_clinica_ortodoncia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @historia_clinica_ortodoncia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /historias_clinicas_ortodoncias/1
  # DELETE /historias_clinicas_ortodoncias/1.xml
  def destroy
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.find(params[:id])
    @historia_clinica_ortodoncia.destroy

    respond_to do |format|
      format.html { redirect_to(historias_clinicas_ortodoncias_url) }
      format.xml  { head :ok }
    end
  end
end
