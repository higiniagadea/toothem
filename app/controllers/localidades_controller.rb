class LocalidadesController < ApplicationController
  
  layout 'default'
  def index
    @localidades = Localidad.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @localidad }
    end
  end

  def show
    @localidad = Localidad.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @localidad }
    end
  end

 
  def new
    @localidad = Localidad.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @localidad }
    end
  end


  def edit
    @localidad = Localidad.find(params[:id])
      respond_to do |format|
      format.html {render :layout => false}
    end
  end

  
  def create
    @localidad = Localidad.new(params[:localidad])
    respond_to do |format|
      if @localidad.save
        flash[:notice] = 'Localidad registrada.'
        format.html { redirect_to(@localidad) }
        format.xml  { render :xml => @localidad, :status => :created, :location => @localidad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @localidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      if @localidad.update_attributes(params[:localidad])
        flash[:notice] = 'Localidad actualizada.'
        format.html { redirect_to(@localidad) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @localidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @localidad = Localidad.find(params[:id])
    @localidad.destroy

    respond_to do |format|
      format.html { redirect_to(localidad_url) }
      format.xml  { head :ok }
    end
  end
end