class ArchivosController < ApplicationController

  #crea la imagen del paciente para la solapa datos personales
   def create
    @archivo = Archivo.new(params[:archivo])
    @paciente = Paciente.find(params[:paciente][:id])
  respond_to do |format|
    if @archivo.save
      @paciente.update_attribute(:archivo_id, @archivo.id)
      flash[:notice] = 'Imagen cambiada'
     format.html { redirect_to edit_paciente_path(@paciente)}
     
    else
      format.html { redirect_to edit_paciente_path(@paciente)}
      flash[:error] = 'Error. Seleccione una imagen'

    end
  end
  end


  def show
    @image_data = Archivo.find(params[:id])
    
     @image = @image_data.db_file.data

    send_data(@image, :type => @image_data.content_type,
                      :filename => @image_data.filename,
                      :disposition => 'inline')

   
  end
 
end