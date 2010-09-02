class ImagenesController < ApplicationController
  # GET /imagenes
  # GET /imagenes.xml
  
  layout 'default'
  
  def index
    @imagenes = Imagen.all
    @pagetitle = "Imagenes"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imagenes }
    end
  end

  # GET /imagenes/1
  # GET /imagenes/1.xml
  def show
    @imagen = Imagen.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      
    end
  end

  # GET /imagenes/new
  # GET /imagenes/new.xml
  def new
    
    @paciente = Paciente.find(params[:id])
    @imagen = Imagen.new(params[:imagen])
    @valor = "imagen"
    @pagetitle = "Nueva imagen"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imagen }
      
    end
  end

  # GET /imagenes/1/edit
  def edit
    @imagen = Imagen.find(params[:id])
  end

  # POST /imagenes
  # POST /imagenes.xml
  def create
    #@paciente = Paciente.find(params[:id])
    @archivo = Archivo.new(params[:archivo])
    if @archivo.save
        params[:imagen][:archivo_id] = @archivo.id
        @imagen = Imagen.new(params[:imagen])
        respond_to do |format|
        if @imagen.save
         flash[:notice] = 'Imagen creada.'
          format.html { redirect_to(pacientes_url(@paciente))}
          format.xml  { render :xml => @imagen, :status => :created, :location => @imagen }
        else
          
          #format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity}
          
        end
      end
    
    end
  end
  

  # PUT /imagenes/1
  # PUT /imagenes/1.xml
  def update
    @imagen = Imagen.find(params[:id])
    respond_to do |format|
      if @imagen.update_attributes(params[:imagen])
        flash[:notice] = 'Imagen Actualizada.'
        format.html { redirect_to(@imagen) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imagenes/1
  # DELETE /imagenes/1.xml
  def destroy
    @imagen = Imagen.find(params[:id])
    @archivo = Archivo.find(@imagen.archivo_id)
    @archivo_thumbnail = Archivo.find(:first, :conditions => 'parent_id =' + @archivo.id.to_s)
    @archivo_thumbnail.destroy
    @archivo.destroy
    @imagen.destroy
    respond_to do |format|
      format.html { redirect_to(paciente_url(@imagen.paciente_id)) }
      format.xml  { head :ok }
    end
  end
 
  
end
