class TurnosController < ApplicationController
  before_filter :login_required
  layout 'default'

    def show
    @turno = Turno.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'default'}
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
   
    events << {:id => turno.id.to_s, :title => turno.profesional_id.to_s,  :start => "#{turno.fecha_hora.iso8601}", :end => "#{turno.duracion.to_s}", :allDay => true}
    end
    render :text => events.to_json
  end
  
 
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
    @turno.destroy
     render :update do |page|
      page<<"$('#desc_dialog').dialog('destroy')"
     
    end
 
  end


  def buscar
    respond_to do |format|
      format.html {render :layout=> 'default'}

    end
  end

#resultado de la busqueda de turnos
  def resultado    
    @profesionales = Profesional.find(params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]
    params[:turno][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id]

    respond_to do |format|
      params[:turno][:profesional_id] =  @profesionales.id

      if params[:profesional][:profesional_id].blank? || params[:turno][:fecha_desde].blank? || params[:turno][:fecha_hasta].blank?
        format.html{render :text => "Ingrese las fechas para realizar la busqueda", :layout => false }
       elsif
         format.html{render :partial=> 'resultado', :layout => false}
         @turnos = Turno.basic_search(params[:turno]).paginate(:page => params[:page], :per_page=> 1)
        
      end

    end

  end
  

  def buscar_dni
    respond_to do |format|
      format.html{ render :layout => false }
    end
  end



  def result_dni
 
    respond_to do |format|
    format.html{render :layout => false}
    end
  end




def asignar_dni
    @paciente = Paciente.find(params[:id])
    respond_to do |format|
      format.js
    end
end
 
  
end
