class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  def index
    @pacientes = Paciente.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
    end
  end

  def search
    @title = "Buscar Paciente"
    
    respond_to do |format|
      format.html # search.html.erb
      
    end
  end

  def result
    
    @pacientes = Paciente.basic_search(params)
    respond_to do |format|
      format.html{render :partial => 'results'}

    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @title = "Pacientes. Datos personales"
    @paciente = Paciente.find(params[:id])
    unless @paciente.archivo_id == 0
      @archivo = Archivo.find(@paciente.archivo_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  def changephoto
    @paciente = Paciente.find(params[:id])
    unless @paciente.archivo_id == 0
      @archivo_ant = Archivo.find(@paciente.archivo_id)
    end
    @archivo = Archivo.new

    respond_to do |format|
      format.html {render :layout => false}# changephoto.html.erb
    
    end
  end


  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @paciente = Paciente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find(params[:id])
  end

  def editfield
    @paciente = Paciente.find(params[:id])
    @value = @paciente[params[:fieldname]]


    render :partial => 'editfield'

  end
  def updatefield
    @paciente = Paciente.find(params[:id])
    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])
        format.html{
          render :update do |page|
            page["f#{params[:pacientes][:fieldname]}"].replace_html params[:paciente]["#{params[:pacientes][:fieldname]}"]
            if params[:pacientes][:fieldname] == "nombre"
              page["pacientes-nombre"].replace_html params[:paciente]["#{params[:pacientes][:fieldname]}"]
            end
            if params[:pacientes][:fieldname] == "matricula"
              page["f#{params[:pacientes][:fieldname]}"].replace_html params[:paciente][:tipo_documento] +" "+ params[:paciente]["#{params[:pacientes][:fieldname]}"]
            end
            if params[:pacientes][:fieldname] == "fecha_nacimiento"
              page["f#{params[:pacientes][:fieldname]}"].replace_html @paciente.fecha_nacimiento.strftime('%d/%m/%Y')
            end
          end
        }
      else
        format.html{
          render :update do |page|
            page["error_messages_for_#{params[:pacientes][:fieldname]}"].replace_html nested_error_messages_for :paciente



          end
        }
      end
    end
  end


  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])

    respond_to do |format|
      if @paciente.save
        flash[:notice] = 'Paciente was successfully created.'
        format.html { redirect_to(@paciente) }
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])
        flash[:notice] = 'Paciente was successfully updated.'
        format.html { redirect_to(@paciente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.xml
  def destroy
    @paciente = Paciente.find(params[:id])
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to(pacientes_url) }
      format.xml  { head :ok }
    end
  end
end
