class ArchivosController < ApplicationController

  def create
    #@paciente = Paciente.find(params[:paciente][:id])
    @archivo = Archivo.new(params[:archivo])
    @paciente = Paciente.find(params[:paciente][:id])
  respond_to do |format|
    if @archivo.save
      @paciente.update_attribute(:archivo_id, @archivo.id)
      flash[:notice] = 'Imagen cambiada'
       format.html{redirect_to(@paciente)}
    else
      format.html { redirect_to edit_paciente_path(@paciente)}
      flash[:error] = 'Error. Seleccione una imagen'
      format.html{redirect_to(@paciente)}
    end
  end
  end
  

  def show    
    @paciente = Paciente.find(params[:archivo][:paciente_id])
    @image_data = Archivo.find(params[:id])
    @image = @image_data.db_file.data
    send_data(@image, :type => @image_data.content_type,
                      :filename => @image_data.filename,
                      :disposition => 'inline')
        respond_to do |format|
          format.html { redirect_to edit_paciente_path(@paciente)}
        end
  end





end