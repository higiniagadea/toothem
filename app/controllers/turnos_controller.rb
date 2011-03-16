class TurnosController < ApplicationController
  layout 'default' 

    def show
    @turno = Turno.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'default'}
   end
  end

# def index
#   @turnos = Turno.first
#   respond_to do |format|
#     format.html
#   end
# end
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

   def get_turnos    
    @turnos = Turno.find(:all, :include => 'profesional')
    events = []
    @turnos.each do |turno|
    #turnos << {:id => turno.id, :fecha => turno.fecha, :profesional => turno.profesional_id, :hora => turno.hora, :duracion => turno.duracion }# || "Some cool description here...", :start => "#{turno.fecha_comienzo.iso8601}", :end => "#{turno.fecha_fin.iso8601}"}
    events << {:id => turno.id.to_s, :title => turno.profesional_id.to_s,  :start => "#{turno.fecha_hora.iso8601}", :end => "#{turno.duracion.to_s}", :allDay => true}
    end
    render :text => events.to_json
  end
  
  # POST /profesionales
  # POST /profesionales.xml
  def create
  
   @turno = Turno.new(params[:turno])
   @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?
   

   respond_to do |format|
    if  @turno.save
      flash[:notice] = 'Turno guardado'
     format.html{redirect_to turnos_path}
    #render :update do |page|
  
     # page<<"$('#calendar').fullCalendar()"
      #page<<"$('#create_turno_dialog').dialog('destroy')"

    end
    end 
  end


  
  
  def update
    @turno = Turno.find(params[:id])
   respond_to do |format|
       if @turno.update_attributes(params[:turno])
         flash[:notice] = 'Turno Actualizado'
         format.html{redirect_to turnos_path}
       end

     end
  end


  def destroy
    @turno = Turno.find_by_id(params[:id])      
     respond_to do |format|
       if @turno.destroy
         flash[:notice] = 'Turno eliminado'
         format.html{redirect_to turnos_path}
       end
      
     end

    #render :update do |page|
     # page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      #page<<"$('#desc_dialog').dialog('destroy')"

 
  end


  #def resize
   #@turno = Turno.find_by_id params[:id]
    #if @turno
     # @turno.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@turno.endtime))
      #@turno.save
    #end
  #end

  def buscar
    respond_to do |format|
      format.html {render :layout=> 'default'}

    end
  end


  def resultado
 
    @profesionales = Profesional.find(params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]

    params[:turno][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id]

    respond_to do |format|
      params[:turno][:profesional_id] =  @profesionales.id
      if params[:profesional][:profesional_id].blank? && params[:fecha].blank?
        format.html{render :text => "Ingrese la fecha para realizar la busqueda", :layout => false }
       elsif
        @turnos = Turno.basic_search(params[:turno])
        format.html{render :partial=> 'resultado', :layout => false}

       end
      
    end
  end

  def buscar_dni   
   @turno = Turno.new
   #@pacientes = Paciente.find()
  respond_to do |format|
      format.html{ render :layout => false }
    end
  end

  def result
  
    respond_to do |format|
      
    end
  end

  def asignar_paciente
     @paciente = Paciente.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
end
