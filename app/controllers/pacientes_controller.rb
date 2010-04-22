class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  before_filter  :generar_submenus
  layout 'default'

  def index
    @pagetitle = "Pacientes"
    @pacientes = Paciente.paginate :page=> params[:page], :per_page=> 15, :order=> 'nombre ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
    end
  end

  def search
    @pagetitle = "Buscar Paciente"
    
    respond_to do |format|
      format.html # search.html.erb
      
    end
  end

  def result
    
    @pacientes = Paciente.basic_search(params)
    @paginatepacientes = Paciente.paginate :page=> params[:page], :per_page=> 15, :order=> 'nombre ASC'
    respond_to do |format|
      format.html{render :partial => 'results'}

    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @title = "Pacientes. Datos personales"
    @paciente = Paciente.find(params[:id])
    unless @paciente.archivo_id.blank?
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
    @title = "Nuevo paciente"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find(params[:id])
    @title = "Editando paciente"
     unless @paciente.archivo_id.blank?
      @archivo = Archivo.find(@paciente.archivo_id)
     end
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
              page["f#{params[:pacientes][:fieldname]}"].replace_html @paciente.tipo_documento.descripcion + " " + params[:paciente]["#{params[:pacientes][:fieldname]}"]
            end
            if params[:pacientes][:fieldname] == "fecha_nacimiento"
              page["f#{params[:pacientes][:fieldname]}"].replace_html @paciente.fecha_nacimiento.strftime('%d/%m/%Y')
            end
            if params[:pacientes][:fieldname] == "sexo"
              page["pacientes-sexo"].replace_html @paciente.sexo
            end
            if params[:pacientes][:fieldname] == "estado_civil"
              page["pacientes-sexo"].replace_html @paciente.estado_civil
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

  def cancelfield
    @paciente = Paciente.find(params[:id])
    respond_to do |format|
      format.html{
        render :update do |page|
            page["f#{params[:fieldname]}"].replace_html @paciente["#{params[:fieldname]}"]
            if params[:fieldname] == "matricula"
              page["f#{params[:fieldname]}"].replace_html @paciente.tipo_documento.descripcion + " " + @paciente["#{params[:fieldname]}"]
            end
            if params[:fieldname] == "fecha_nacimiento"
              page["f#{params[:fieldname]}"].replace_html @paciente.fecha_nacimiento.strftime('%d/%m/%Y')
            end
          end
      }
    end
  end

  def search_titular
    @paciente = Paciente.find(params[:id])
    @titulares = Titular.new
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def results_titular
    @paciente = Paciente.find(params[:id])
    @titulares = Titular.basic_search_in_pacientes(params)
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def update_titular
    @paciente = Paciente.find(params[:paciente_id])
    @titular =  Titular.find(params[:id])

    @paciente.update_attribute(:titular_id, @titular.id)
     
    respond_to do |format|
        format.html{redirect_to(@paciente)}
      end

    end

  def new_titular
    @paciente = Paciente.find(params[:id])
    @titular = Titular.new
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def create_titular
    @paciente = Paciente.find(params[:id])
    @titular = Titular.new(params[:titular])
    
    respond_to do |format|
      if @titular.save
        @paciente.update_attribute(:titular_id, @titular.id)
        flash[:notice] = 'Titular creado.'
        format.html {redirect_to(@paciente)}
        
      else
        format.html { render :action => "new_titular" }
      end
    end
  end
#  def show_titular
#    @titular = Titular.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @titular }
#    end
#  end


  
  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])
    @title = "Nuevo paciente"
    respond_to do |format|
      if @paciente.save
        flash[:notice] = 'Paciente was successfully created.'
        format.html { redirect_to(pacientes_path) }
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
    @title = "Editando paciente"
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
