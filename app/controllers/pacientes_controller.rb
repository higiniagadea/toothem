class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  before_filter  :generar_submenus
  before_filter :login_required
  layout 'default'

  def new_ficha
    params[:paciente][:consultorio_id] = session[:consultorio][:id]
    @paciente = Paciente.find(params[:paciente_id])
    @tratamiento = Tratamiento.new
    respond_to do |format|
     format.html {render :layout => 'layout'}
     format.html {render :controller => 'ficha', :action => 'new'} #partial _new solo agrega a la lista el tratamiento
     
    end
  end

  def new_trat
    params[:paciente][:consultorio_id] = session[:consultorio][:id]
    @paciente = Paciente.find(params[:paciente_id])
    @tratamiento = Tratamiento.new
    respond_to do |format|
     format.html {render :layout => false }
     format.html {render :controller => 'tratamientos', :action => 'new_trat'}  #partial _new_trat crea el tratamiento

    end
  end

  def index
    @pagetitle = "Pacientes"
    consultorios = []
    current_usuario.consultorios.each {|x| consultorios << x.consultorio_id}
    #@pacientes = Paciente.paginate :page=> params[:page], :per_page=> 15, :conditions => ['consultorio_id in ?', @consultorio.id], :order=> 'nombre ASC'
    @pacientes = Paciente.paginate :page=> params[:page], :per_page=> 5, :order=> 'nombre ASC'
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
    end
  end

  #busqueda de pacientes
  def search
    @pagetitle = "Buscar Paciente"
    
   respond_to do |format|
      format.html # search.html.erb
      
    end
  end

  #resultado de la busqueda de pacientes
  def result
    @paginatepacientes = Paciente.paginate :page=> params[:page], :per_page=> 10, :order=> 'nombre ASC'
   

    respond_to do |format|
      if params[:nombre].blank? && params[:matricula].blank?
       
       format.html{render :text => 'Ingrese al menos un dato para realizar la busqueda', :layout => false}
      elsif
      params[:nombre].size > 3
        @pacientes = Paciente.basic_search(params)
        format.html{render :partial => 'results'}
      else
        format.html{render :text=> 'Debe ingresar al menos 3 caracteres en el campo de texto'}
      end
    end
   
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @title = "Pacientes. Datos personales"
    @paciente = Paciente.find(params[:id])
    #@imagenes = Imagen.find_all_by_paciente_id(@paciente)
    
    #unless @paciente.archivo_id.blank?
     # @archivo = Archivo.find(@paciente.archivo_id)
    #end
    respond_to do |format|

      format.html # show.html.erb
      format.xml  { render :xml => @paciente }
    end
  end
  def show_imagen
    @imagen = Imagen.find(params [:id])
    respond_to do |format|
      format.html {redirect_to show_imagen_path(@imagen)}
    end
  end

  def changephoto
    @paciente = Paciente.find(params[:id])
    @value = params[:value]
    unless @paciente.archivo_id.blank?
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
    #@title = "Nuevo paciente"
    respond_to do |format|
      format.html
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find_by_id(params[:id])
    @title = "Editando paciente"
     respond_to do |format|
      unless @paciente.blank?
      unless @paciente.archivo_id.blank?
         @archivo = Archivo.find(@paciente.archivo_id)
       end
   

        format.html unless @paciente.id.blank?
      else
        format.html {redirect_to search_pacientes_path}
      end
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
#busqueda de titulares
  def search_titular
    @paciente = Paciente.find(params[:id])
    @titulares = Titular.new
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  #resultado de la busqueda de titulares
  def results_titular
    @paciente = Paciente.find(params[:id])
    @titulares = Titular.basic_search_in_pacientes(params[:titular])
    #@titulares = Titular.find_all_by_obra_social_id(params[:obra_social].to_i)
    respond_to do |format|
      format.html {render :layout => false}

  end
  end
  
  def update_titular
    @paciente =  Paciente.find(params[:paciente_id])
    @titular =  Titular.find(params[:id])
    @paciente.update_attribute(:titular_id, @titular.id)

    respond_to do |format|
    format.html {redirect_to edit_paciente_path(@paciente) + '#obra_social'}
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
        #format.html {redirect_to @paciente}
         format.html {render :partial=> 'pacientes/edit_obra_social', :layout => 'default'}
      else
        format.html { render :action => ""  }
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
    params[:paciente][:consultorio_id]= current_usuario.consultorios
    params[:paciente][:usuario_id]= current_usuario.id
    @paciente = Paciente.new(params[:paciente])
    @title = "Nuevo paciente"
    respond_to do |format|
      if @paciente.save
        flash[:notice] = 'Paciente creado.'
        format.html { redirect_to edit_paciente_path(@paciente)}
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
    @imagenes = Imagen.find_all_by_paciente_id(@paciente)

    unless @paciente.archivo_id.blank?
      @archivo = Archivo.find(@paciente.archivo_id)
    end
    @title = "Editando paciente"
    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])
       
        flash[:notice] = 'Paciente actualizado.'
        #format.html { redirect_to(@paciente) }
        format.html {render :partial=> 'pacientes/edit_datos_personales', :layout => 'default'}
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
      format.html { redirect_to(search_pacientes_url) }
      format.xml  { head :ok }
    end
  end

  def listado_historias_clinicas
   @paciente = Paciente.find(params[:id])
   @pagetitle = "Historias Clinicas de "+ @paciente.nombre
   respond_to do |format|
    format.html{ render :partial => 'listado_historias_clinicas', :layout => false }
   end
  end

def update_tratamiento
  @paciente = Paciente.find(params[:paciente_id])
  @tratamiento = Tratamiento.find(params[:id])
  respond_to do |format|
    if 
      @tratamiento.update_attributes(params[:tratamiento])
    end
    format.html{ redirect_to(@tratamiento)}
  end
end


def ver
  @paciente = Paciente.find(params[:id])
   @imagenes = Imagen.find_all_by_paciente_id(@paciente)

    unless @paciente.archivo_id.blank?
    @archivo = Archivo.find(@paciente.archivo_id)
    end
  respond_to do |format|
    format.html{ render :partial => 'ver'}
   end
end

#imprime un reporte del paciente
def imprimir
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      format.html {render :layout=> "print", :action => "reporte"}   #ccs :layout=>false
    
    end
end


#valida una matricula duplicada
def verificar_matricula
   
    @paciente = Paciente.find(:first, :conditions => {:matricula => params[:paciente][:matricula]})
    respond_to do |format|
    
    format.json { render :json => !@paciente}
   
    end
  end

#valida un nro de afiliado duplicado
def verificar_nroafiliado
  @paciente = Paciente.find(:first, :conditions => {:nro_afiliado => params[:paciente][:nro_afiliado]})
    respond_to do |format|
    format.json { render :json => !@paciente}
    end
  end

#elimina el titular asignado al paciente
def elimina_tit
  @paciente = Paciente.find(params[:id])
  #@titular = Titular.find(params[:id])

  @paciente.update_attribute(:titular_id, nil)
   respond_to do |format|
      format.html {redirect_to(edit_paciente_path(@paciente) + '#obra_social') }
      format.xml  { head :ok }
end
end

#valida la matricula del titular
def verificar_matricula_tit

    @titular = Titular.find(:first, :conditions => {:matricula => params[:titular][:matricula]})
    respond_to do |format|
    format.json { render :json => !@titular}
    end
  end

#valida el nro de afiliado del titular
def verificar_nroafiliado_tit
  @titular = Titular.find(:first, :conditions => {:nro_afiliado => params[:titular][:nro_afiliado]})
    respond_to do |format|


    format.json { render :json => !@titular}
    end
  end

end


