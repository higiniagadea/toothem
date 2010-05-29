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
<<<<<<< HEAD:app/controllers/historias_clinicas_ortodoncias_controller.rb
    @pagetitle = "Historia Clinica Ortodoncica de: " + @paciente.nombre
=======
    @pagetitle = "Historia clinica de ortodoncia de "+ @paciente.nombre
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_ortodoncias_controller.rb
    respond_to do |format|
      format.html # show.html.erb
     
    end
  end

  # GET /historias_clinicas_ortodoncias/new
  # GET /historias_clinicas_ortodoncias/new.xml
  def new
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.new
<<<<<<< HEAD:app/controllers/historias_clinicas_ortodoncias_controller.rb
    @pagetitle = "Historia Clinica Ortodoncica de: " + @paciente.nombre
=======
    @pagetitle = "Historia clinica de ortodoncica" + @paciente.nombre
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_ortodoncias_controller.rb
    respond_to do |format|      
      format.html #historia clinica ortod
    end
       
  end
  

  # GET /historias_clinicas_ortodoncias/1/edit
  def edit
    @historia_clinica_ortodoncia = @paciente.historia_clinica_ortodoncia.find(params[:id])
<<<<<<< HEAD:app/controllers/historias_clinicas_ortodoncias_controller.rb
    @pagetitle = 'Editando Historia Clinica Ortodoncica de: ' + @paciente.nombre
=======
    @pagetitle = 'Editando Historia Clinica Ortodoncica de:' + @paciente.nombre    
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_ortodoncias_controller.rb
  end
  # POST /historias_clinicas_ortodoncias
  # POST /historias_clinicas_ortodoncias.xml
  def create
    params[:historia_clinica_ortodoncia][:paciente_id] = @paciente.id
    @historia_clinica_ortodoncia = HistoriaClinicaOrtodoncia.new(params[:historia_clinica_ortodoncia])
    respond_to do |format|
      if @historia_clinica_ortodoncia.save
<<<<<<< HEAD:app/controllers/historias_clinicas_ortodoncias_controller.rb
        flash[:notice] = 'Historia Clinica Ortodoncica creada.'
        format.html{render :action => 'show'}
=======
        flash[:notice] = 'Historia Clinica Ortodoncia creada.'
        format.html{redirect_to @paciente}
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_ortodoncias_controller.rb
       # format.xml  { render :xml => @historia_clinica_ortodoncia, :status => :created, :location => @historia_clinica_ortodoncia }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @historia_clinica_ortodoncia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /historias_clinicas_ortodoncias/1
  # PUT /historias_clinicas_ortodoncias/1.xml
  def update
    @historia_clinica_ortodoncia = @paciente.historia_clinica_ortodoncia.find(params[:paciente_id])

    respond_to do |format|
      if @historia_clinica_ortodoncia.update_attributes(params[:historia_clinica_ortodoncia])
        flash[:notice] = 'Historia Clinica Ortodoncia creada.'
        format.html {redirect_to(new_paciente_historia_clinica_ortodoncia_path(@paciente)) }
      
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
