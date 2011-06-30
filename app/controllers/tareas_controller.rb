class TareasController < ApplicationController
   layout 'default'
  def tarea
    @tareas = Tarea.all
    respond_to do |format|
      format.html {render :layout => 'default'}
    end
  end

    def show
    @tarea = Tarea.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'default'}
    end
  end


   def new
    @tarea = Tarea.new
    respond_to do |format|
      format.html  { render :layout => 'default' }
    end
  end


  def edit
    @tarea = Tarea.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /profesionales
  # POST /profesionales.xml
  def create
   @tarea = Tarea.new(params[:tarea])
    respond_to do |format|
      if @tarea.save
        flash[:notice] = 'Tarea guardado'
        format.html { redirect_to busq_turnos_path  }
      else
        format.html { redirect_to busq_turnos_path  }
        flash[:error] = 'El horario ya fue asignado con anterioridad'
      end
    end

  end
  def update
    @tarea = Tarea.find(params[:id])
    respond_to do |format|
      if @tarea.update_attributes(params[:tarea])
          flash[:notice] = 'Tarea actualizada'
        format.html { redirect_to cambios_turnos_path  }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      format.html { redirect_to busq_turnos_path }

    end
  end

   def get_tareas
    @tareas = Tarea.find(:all, :include => 'profesional')

    events = []
    @tareas.each do |tarea|
    events << {:id => tarea.id.to_s, :title => tarea.profesional_id.to_s, :start => "#{tarea.fecha_hora.iso8601}", :end => "#{(tarea.fecha_hora + (60 * tarea.duracion))}", :allDay => true, :oservaciones => "#{(tarea.observaciones)}"}
    end
    render :text => events.to_json
  end

   def eliminar
    @tarea = Tarea.find_by_id(params[:id])
    @tarea.destroy
   respond_to do |format|
      flash[:notice] = 'Tarea eliminada'
     format.html{redirect_to busq_turnos_path}
   end
  end

end
