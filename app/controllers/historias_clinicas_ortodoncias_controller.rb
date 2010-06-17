class HistoriasClinicasOrtodonciasController < ApplicationController
  # GET /historias_clinicas_ortodoncias
  # GET /historias_clinicas_ortodoncias.xml
 
  before_filter(:get_paciente)
   layout 'default'
  #def index
   # @historias_clinicas_ortodoncias = @paciente.historias_clinicas_ortodoncias.all
    #@pagetitle = 'Historias Clinicas Ortodoncias'
    #respond_to do |format|
   #   format.html # index.html.erb
      #format.xml  { render :xml => @historias_clinicas_ortodoncias }

    #end
  #end
  # GET /historias_clinicas_ortodoncias/1
  # GET /historias_clinicas_ortodoncias/1.xml
  def show
    @historia_clinica_ortodoncia = @paciente.historia_clinica_ortodoncia
    @title = "Historia Ortodoncica "
    respond_to do |format|
      format.html # show.html.erb
     
    end
  end


  def imprimir
    @historia_clinica_ortodoncia = @paciente.historia_clinica_ortodoncia
    @title = "Historia Ortodoncica de "+ @paciente.nombre
    respond_to do |format|
      format.html {render :layout=> "print", :action => "print"}
      #format.xml  { render :xml => @historia_clinica_general }

    end
  end

  # GET /historias_clinicas_ortodoncias/new
  # GET /historias_clinicas_ortodoncias/new.xml
  def new
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.new
    @title = "Historia Clinica Ortodoncica"

    respond_to do |format|      
      format.html #historia clinica ortod
    end
       
  end
  

  # GET /historias_clinicas_ortodoncias/1/edit
  def edit
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.find(params[:paciente_id])
    @title = 'Editando Historia Clinica Ortodoncica'

  end
  # POST /historias_clinicas_ortodoncias
  # POST /historias_clinicas_ortodoncias.xml
  def create
    params[:historia_clinica_ortodoncia][:paciente_id] = @paciente.id
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.new(params[:historia_clinica_ortodoncia])
    respond_to do |format|
      if @historia_clinica_ortodoncia.save

        flash[:notice] = 'Historia Clinica Ortodoncia creada.'
        format.html{render :action => 'show'}
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @historia_clinica_ortodoncia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /historias_clinicas_ortodoncias/1
  # PUT /historias_clinicas_ortodoncias/1.xml
  def update
    @historia_clinica_ortodoncia = @paciente.historia_clinica_ortodoncia

    respond_to do |format|
      if @historia_clinica_ortodoncia.update_attributes(params[:historia_clinica_ortodoncia])
        flash[:notice] = 'Historia Clinica Ortodoncia creada.'
        format.html {redirect_to paciente_historia_clinica_ortodoncia_path }
      else
        format.html { render :action => 'show'}
       end
    end
  end

  # DELETE /historias_clinicas_ortodoncias/1
  # DELETE /historias_clinicas_ortodoncias/1.xml
  def destroy
    @historia_clinica_ortodoncia = @paciente.historia_clinica_ortodoncia.find(params[:paciente_id])
    @historia_clinica_ortodoncia.destroy

    respond_to do |format|
      format.html {redirect_to new_paciente_historia_clinica_ortodoncia_path}
      
    end
  end

   private

  def get_paciente
    @paciente= Paciente.find(params[:paciente_id])
  end

end
