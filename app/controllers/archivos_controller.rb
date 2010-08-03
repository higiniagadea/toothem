class ArchivosController < ApplicationController

  def create
    @archivo = Archivo.new(params[:archivo])
    @paciente = Paciente.find(params[:paciente][:id])
    if @archivo.save
      @paciente.update_attribute(:archivo_id, @archivo.id)
      flash[:notice] = 'Imagen cambiada'
      redirect_to(@paciente)
    else
      flash[:error] = 'Error al subir el archivo. El archivo es una imagen?'
      redirect_to(@paciente)
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