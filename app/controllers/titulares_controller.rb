class TitularesController < ApplicationController
  # GET /titulares
  # GET /titulares.xml
  def index
    @titulares = Titular.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @titulares }
    end
  end

  # GET /titulares/1
  # GET /titulares/1.xml
  def show
    @titular = Titular.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @titular }
    end
  end

  # GET /titulares/new
  # GET /titulares/new.xml
  def new
    @titular = Titular.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @titular }
    end
  end

  # GET /titulares/1/edit
  def edit
    @titular = Titular.find(params[:id])
  end

  # POST /titulares
  # POST /titulares.xml
  def create
    @titular = Titular.new(params[:titular])

    respond_to do |format|
      if @titular.save
        flash[:notice] = 'Titular creado.'
        format.html { redirect_to(@titular) }
        format.xml  { render :xml => @titular, :status => :created, :location => @titular }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titular.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /titulares/1
  # PUT /titulares/1.xml
  def update
    @titular = Titular.find(params[:id])

    respond_to do |format|
      if @titular.update_attributes(params[:titular])
        flash[:notice] = 'Titular actualizado'
        format.html { redirect_to(@titular) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titular.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /titulares/1
  # DELETE /titulares/1.xml
  def destroy
    @titular = Titular.find(params[:id])
    @titular.destroy

    respond_to do |format|
      flash[:notice] = 'Titular eliminado'
      format.html { redirect_to(titulares_url) }
      format.xml  { head :ok }
    end
  end
  def buscar
    respond_to do |format|
      format.html # buscar.html.erb

    end
  end
  def resultado
    @titulares = Titular.basic_search(params)
    respond_to do |format|
      format.html {render :layout => false}

    end

  end
end
