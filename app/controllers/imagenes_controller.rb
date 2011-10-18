class ImagenesController < ApplicationController
  # GET /imagenes
  # GET /imagenes.xml
  require 'RMagick'
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

 
  def new
    
    @paciente = Paciente.find(params[:id])
    @imagen = Imagen.new(params[:imagen])
    @valor = "imagen"
    @pagetitle = "Nueva imagen"
    respond_to do |format|
      format.html {render :layout => false}
     
      
    end
  end

  
  def edit    
   @imagen = Imagen.find(params[:id])

    respond_to do |format|
      format.html{render :layout => false}


    end
  end

  #crea las imagenes en general para un paciente, luego mostrar en slide
  def create
    @paciente = Paciente.find(params[:imagen][:paciente_id])
    @archivo = Archivo.new(params[:archivo])
   
    respond_to do |format|

      if @archivo.save
        params[:imagen][:archivo_id] = @archivo.id
        @imagen = Imagen.new(params[:imagen])
        @imagen.save
         flash[:notice] = 'Imagen cargada.'
         format.html { redirect_to edit_paciente_path(@paciente.id) + '#imagenes'}
       
        else
          
          format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity}
          
        end
     
    
    end
  end
  
  def update

      @imagen = Imagen.find(params[:id])
      @archivo = Archivo.find(@imagen.archivo_id)

    respond_to do |format|

      if @archivo.update_attributes(params[:archivo])
        flash[:notice] = 'Imagen Actualizada.'
         format.html { redirect_to edit_paciente_url(@imagen.paciente_id) + '#imagenes'}
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
       flash[:notice] = 'Imagen Eliminada'
      format.html { redirect_to edit_paciente_url(@imagen.paciente_id) + '#imagenes' }
      format.xml  { head :ok }
    end
  end
 
  
end
