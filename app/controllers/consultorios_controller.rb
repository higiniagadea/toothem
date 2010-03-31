class ConsultoriosController < ApplicationController
  # GET /consultorios
  # GET /consultorios.xml
  def index
    @consultorios = Consultorio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultorios }
    end
  end

  # GET /consultorios/1
  # GET /consultorios/1.xml
  def show
    @consultorio = Consultorio.find(params[:id])
    #@consultorio.profesionales << Profesional.find(:first)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consultorio }
    end
  end

  # GET /consultorios/ne
  # GET /consultorios/new.xml
  def new
    @consultorio = Consultorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consultorio }
    end
  end

  # GET /consultorios/1/edit
  def edit
    @consultorio = Consultorio.find(params[:id])
  end

  # POST /consultorios
  # POST /consultorios.xml
  def create
    @consultorio = Consultorio.new(params[:consultorio])

    respond_to do |format|
      if @consultorio.save
        flash[:notice] = 'Consultorio creado.'
        format.html { redirect_to(@consultorio) }
        format.xml  { render :xml => @consultorio, :status => :created, :location => @consultorio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consultorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultorios/1
  # PUT /consultorios/1.xml
  def update
    @consultorio = Consultorio.find(params[:id])

    respond_to do |format|
      if @consultorio.update_attributes(params[:consultorio])
        flash[:notice] = 'Consultorio actualizado.'
        format.html { redirect_to(@consultorio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consultorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultorios/1
  # DELETE /consultorios/1.xml
  def destroy
    @consultorio = Consultorio.find(params[:id])
    @consultorio.destroy

    respond_to do |format|
      format.html { redirect_to(consultorios_url) }
      format.xml  { head :ok }
    end
  end
end
