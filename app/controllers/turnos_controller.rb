class TurnosController < ApplicationController
  before_filter :login_required
  layout 'default'

  
  def busq
   if params[:profesional_id]
     @turnos = Turno.find(:all, :conditions => ['profesional_id = ?', params[:profesional_id]])
   else
    @turnos = Turno.find(:all)
   end
      respond_to do |format|
       format.html
      end
  end

  

  def agenda
       respond_to do |format|      
      @turnos = Turno.find(:all, :conditions => ['profesional_id = ?', params[:profesional_id]])
      format.html{render :layout => false, :partial => 'agenda'}
    
  end
  end

    def show
    @turno = Turno.find(params[:id])
    respond_to do |format|
      format.html{ render :partial => 'prueba', :layout => 'default'}
   end
  end

    def turno_tarea
       @turno = Turno.new
       @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?
       @tarea = Tarea.new
       
      respond_to do |format|
        format.html{render :layout => false}
      end
    end



   def new    
    @turno = Turno.new    
    @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?
   respond_to do |format|
     format.html{render :layout => false}
    end

   end
 
  def edit
    @turno = Turno.find_by_id(params[:id])
    respond_to do |format|
      format.html{render :layout => false}
    end
    
  end

  #muestra los turnos en el calendario
   def get_turnos
    @turnos = Turno.find(:all, :include => 'profesional')    
    events = []
    @turnos.each do |turno|   
    events << {:id => turno.id.to_s, :title => turno.profesional_id.to_s, :start => "#{turno.fecha_hora.iso8601}", :end => "#{(turno.fecha_hora + (60 * turno.duracion))}", :allDay => true, :oservaciones => "#{(turno.observaciones)}"}
    end
    render :text => events.to_json
  end
  
 
  def create
 
   @turno = Turno.new(params[:turno])   
   @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?
 #unless @turno.valid?
  # errores = ''
#@turno.errors.each { |a, msgg| errores += a + '- '+msgg+'<br/>'  }
 #  raise errores
 #end
   respond_to do |format|
    if  @turno.save
      flash[:notice] = 'Turno guardado'
      format.html{redirect_to busq_turnos_path}
 
    end
  end
  end
  
  
  def update
    @turno = Turno.find(params[:id])
    
   respond_to do |format|
       if @turno.update_attributes(params[:turno])
         flash[:notice] = 'Turno Actualizado'
         format.html{redirect_to cambios_turnos_path}
       end
     end
  end


  def destroy
   @turno = Turno.find_by_id(params[:id])
    @turno.destroy
   respond_to do |format|
      flash[:notice] = 'Turno eliminado'
     format.html{redirect_to busq_turnos_path}
   end
 
  end


  def eliminar
    @turno = Turno.find_by_id(params[:id])
    @turno.destroy
   respond_to do |format|
      flash[:notice] = 'Turno eliminado'
     format.html{redirect_to busq_turnos_path}
   end
  end

  def cambios
    respond_to do |format|
      format.html
    end
  end

  def resultado
    @profesionales = Profesional.find(params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]
    params[:turno][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id].blank?
   
    respond_to do |format|
      params[:turno][:profesional_id] =  @profesionales.id
      
     unless params[:turno][:fecha_desde].blank?
      if params[:paciente_desc].blank?

        @tareas = Tarea.buscar(params[:turno]).paginate(:page => params[:page], :per_page=> 10)
        format.html{render :partial => 'tareas/tarea', :layout => false}
       
       else      
         
        @turnos = Turno.basic_search(params[:turno]).paginate(:page => params[:page], :per_page=> 10)
        format.html{render :partial=> 'resultado', :layout => false}
           
      end
     end
    end
  end


  end

