class TurnosController < ApplicationController
  layout 'default' 

  #  def show
    #@turno = Turno.find(params[:id])
    #respond_to do |format|
     # format.html { render :layout => 'default'}
    #end
  #end


   def new
    @turno = Turno.new
    @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?
   respond_to do |format|
      format.html {render :layout => false}
    end
  end

 
  def edit
    @turno = Turno.find_by_id(params[:id])
    respond_to do |format|
      format.html {render :layout => 'default'}
    end
  end

   def get_turnos    
    @turnos = Turno.find(:all)#, :conditions => ["fecha >= #{Time.at(params['fecha'].to_i).to_formatted_s(:db)}"])
    turnos = []
    @turnos.each do |turno|
    turnos << {:id => turno.id, :fecha => turno.fecha, :profesional => turno.profesional, :hora => turno.hora, :duracion => turno.duracion }# || "Some cool description here...", :start => "#{turno.fecha_comienzo.iso8601}", :end => "#{turno.fecha_fin.iso8601}"}
    end
   
  end
  
  # POST /profesionales
  # POST /profesionales.xml
  def create
   @turno = Turno.new(params[:turno])
   @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?

    respond_to do |format|
    if @turno.save
      format.html{redirect_to turnos_path, :layout => 'default'}
    #render :update do |page|
    else
      #page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      format.html{redirect_to turnos_path}
        #page<<"$('#create_turno_dialog').dialog('destroy')"
    end   

  end
  end
  
  def update
    @turno = Turno.find_by_id(params[turno][:id])
   render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')"
    end
  end

  def destroy
    @turno = Turno.find(params[:id])
    @turno.destroy
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')"
    end
 
  end


  def resize
    @turno = Turno.find_by_id params[:id]
    if @turno
      @turno.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@turno.endtime))
      @turno.save
    end
  end

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
       if  params[:turno][:fecha_desde].blank?
        format.html{render :text => "Ingrese la fecha para realizar la busqueda", :layout => false }
       else
        @turnos = Turno.basic_search(params)
        format.html{render :partial=> 'resultado', :layout => false}

       end
    end
  end

  
  
end
