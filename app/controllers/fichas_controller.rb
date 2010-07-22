class FichasController < ApplicationController
  # GET /fichas
  # GET /fichas.xml
  layout 'default'
  def index
    @fichas = Ficha.all
    @paciente = Paciente.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichas }
    end
  end

  # GET /fichas/1
  # GET /fichas/1.xml
 def show
    @ficha = Ficha.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @ficha }
    end
  end

  # GET /fichas/new
  # GET /fichas/new.xml
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @ficha = Ficha.new
    #@ficha.tratamientos
     
    respond_to do |format|
      format.html
      format.xml  { render :xml => @ficha }
      
      end
   end
 
  # GET /fichas/1/edit
  def edit
    @ficha = Ficha.find(params[:id])
  end

  # POST /fichas
  # POST /fichas.xml
  def create
    @paciente = Paciente.find(params[:ficha][:paciente_id])
    @ficha = Ficha.new(params[:ficha])
    @tratamiento = Tratamiento.new(params[:ficha_id])
    @ficha.paciente_id = @paciente.id
    @ficha.localidad_id = @paciente.localidad_id
    
    respond_to do |format|
      if @ficha.save
       format.html {redirect_to(@ficha)}
      else
         format.html { render :action => "new" }
         
     end

    end
  end
#
#    @ficha = Ficha.new(params[:ficha])
#    respond_to do |format|
#      if @ficha.save
#        flash[:notice] = 'Ficha creada.'
#        format.html  { redirect_to(@ficha) }
#      else
#        format.html { render :action => 'new' }
#        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
#      end
#    end
  

  # PUT /fichas/1
  # PUT /fichas/1.xml
  def update
    @ficha = Ficha.find(params[:id])
    
     respond_to do |format|
      if @ficha.update_attributes(params[:ficha])
        flash[:notice] = 'Ficha actualizada.'
        format.html { redirect_to(:action =>'new') }
        format.xml  { head :ok }
     else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichas/1
  # DELETE /fichas/1.xml
  def destroy
    @ficha = Ficha.find(params[:id])
    @ficha.destroy

    respond_to do |format|
      format.html { redirect_to(fichas_url) }
      format.xml  { head :ok }
    end
  end
end
