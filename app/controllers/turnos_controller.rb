class TurnosController < ApplicationController
  before_filter :login_required
  layout 'default'

  def busq
   
     respond_to do |format|
       format.html
      end
  end

  

  def agenda
       respond_to do |format|   
       if params[:profesional][:profesional_id].blank?
         format.html{render :text => '<span style="color:red">Seleccione un profesional</span>' }
       else
      
        format.html{render :layout => false, :partial => 'agenda'}
        @turnos = Turno.find(:all, :conditions => ['profesional_id= ?', params[:profesional][:profesional_id]])
         
        end
  end
  end

    def show

    @turno = Turno.find(params[:id])
    respond_to do |format|
      format.html{ render :partial => 'agenda', :layout => 'default'}
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
      format.xml  { render :xml => @turno }
    end

   end
 
  def edit
    @turno = Turno.find_by_id(params[:id])
    respond_to do |format|
      format.html{render :layout => false}
    end
    
  end
 
 
  def create
 
   @turno = Turno.new(params[:turno])   
   @profesional = Profesional.find(params[:profesional_id]) unless params[:profesional_id].blank?

   respond_to do |format|
    if  @turno.save
      flash[:notice] = 'Turno guardado'
      format.html{redirect_to busq_turnos_path}
      format.xml  { render :xml => @turno, :status => :created, :location => @turno }

      else

        format.html{redirect_to busq_turnos_path}
      error = ''
      flash[:error] = @turno.errors.each{|a,e| error += e + '</br>'}
       #format.html { render :action => "new"  }
        #format.xml  { render :xml => @turno.errors, :status => :unprocessable_entity }
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



 def get_turnos
    @turnos = Turno.find(:all, :include => 'profesional')

    events = []
    @turnos.each do |turno|
    events << {:id => turno.id.to_s, :title => turno.observaciones, :start => "#{turno.fecha_hora.iso8601}", :end => "#{(turno.fecha_hora.iso8601 + (60 * turno.duracion))}", :allDay => true, :oservaciones => "#{(turno.observaciones)}"}
    end
    render :text => events.to_json
  end


  def cambios
    respond_to do |format|
      format.html
    end
  end

  def resultado
    @profesionales = Profesional.find(params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]
    #params[:turno][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id].blank?
    respond_to do |format|

      params[:turno][:profesional_id] == @profesionales.id
      
     unless params[:turno][:fecha_desde].blank?
      params[:turno][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id].blank?
       
      if params[:paciente_desc].blank?
        
        @tar = Tarea.buscar(params).paginate(:page => params[:page], :per_page=> 12, :conditions => ['profesional_id= ?', params[:profesional][:profesional_id]])
        format.html{render :partial => 'tareas/tarea', :layout => false}
       
      elsif
       
        @tur = Turno.basic_search(params[:paciente_desc]).paginate(:page => params[:page], :per_page=> 12, :conditions => ['profesional_id= ? ', params[:profesional][:profesional_id]])
        format.html{render :partial=> 'turnos/resultado', :layout => false}
      else


      end
        end
     end
    

  end

  end

