class TratamientosController < ApplicationController
  # GET /tratamientos
  # GET /tratamientos.xml
  layout 'default'
  def index
    
    @tratamientos = Tratamiento.all
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tratamientos }
    end
  end

  # GET /tratamientos/1
  # GET /tratamientos/1.xml
  def show
    @tratamiento = Tratamiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tratamiento }
    end
  end

  # GET /tratamientos/new
  # GET /tratamientos/new.xml
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @tratamiento = Tratamiento.new
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
    @ficha = Ficha.find(params[:ficha_id]) unless params[:ficha_id].blank?
    respond_to do |format|
      format.html {render :partial => 'new', :layout => 'default'}
      format.xml  { render :xml => @tratamiento }
    end
  end

  # GET /tratamientos/1/edit
  def edit
    @tratamiento = Tratamiento.find(params[:id])
  end

  # POST /tratamientos
  # POST /tratamientos.xml
  def create
    @paciente = Paciente.find(params[:tratamiento][:paciente_id])

    #params[:tratamiento][:paciente_id] = @paciente.id
    #@tratamiento = Tratamiento.new(params[:tratamiento][:paciente_id])
    @tratamiento = Tratamiento.new(params[:tratamiento])
    @tratamientos = Tratamiento.find(:all, :conditions => ['paciente_id =?', @paciente.id.to_s])
    
    respond_to do |format|
      if @tratamiento.save
        flash[:notice] = 'Tratamiento creado.'
        format.html  { redirect_to new_tratamiento_path + "?paciente_id="+@paciente.id.to_s }
        
      else
        
        format.xml  { render :xml => @tratamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tratamientos/1
  # PUT /tratamientos/1.xml
  def update
    @tratamiento = Tratamiento.find(params[:id])

    respond_to do |format|
      if @tratamiento.update_attributes(params[:tratamiento])
        flash[:notice] = 'Tratamiento actualizado.'
        format.html { redirect_to(@tratamiento)}
        format.xml  { head :ok }
        
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tratamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tratamientos/1
  # DELETE /tratamientos/1.xml
  def destroy
    @tratamiento = Tratamiento.find(params[:id])
    @tratamiento.destroy

    respond_to do |format|
      flash[:notice] = 'Tratamiento eliminado'
      format.html { redirect_to tratamientos_path }
      format.xml  { head :ok }
    end
  end
end
