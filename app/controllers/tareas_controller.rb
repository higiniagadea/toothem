class TareasController < ApplicationController
   layout 'default'
  def index
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
      format.html {render :layout => 'default'}
    end
  end

  # POST /profesionales
  # POST /profesionales.xml
  def create
   @tarea = Tarea.new(params[:tarea])
    respond_to do |format|
      if @tarea.save
        flash[:notice] = 'Tarea guardado'
        format.html { redirect_to turnos_path  }
      else
        format.html { render :action => "new" }
      end
    end

  end
  def update
    @tarea = Tarea.find(params[:id])
    respond_to do |format|
      if @tarea.update_attributes(params[:tarea])
        format.html { redirect_to tareas_path  }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      format.html { redirect_to tareas_path }

    end
  end

end
