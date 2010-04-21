class ProfesionalesController < ApplicationController
  # GET /profesionales
  # GET /profesionales.xml
  layout 'default'
  def index
   # @profesionales = Profesional.all
  @profesionales = Profesional.paginate :page=> params[:page], :per_page=>15, :order=> 'nombre ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profesionales }
    end
  end

  # GET /profesionales/1
  # GET /profesionales/1.xml
  def show
    @profesional = Profesional.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesional }
    end
  end

  # GET /profesionales/new
  # GET /profesionales/new.xml
  def new
    @profesional = Profesional.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesional }
    end
  end

  # GET /profesionales/1/edit
  def edit
    @profesional = Profesional.find(params[:id])
  end

  # POST /profesionales
  # POST /profesionales.xml
  def create
    @profesional = Profesional.new(params[:profesional])

    respond_to do |format|
      if @profesional.save
        flash[:notice] = 'Profesional creado.'
        format.html { redirect_to(@profesional) }
        format.xml  { render :xml => @profesional, :status => :created, :location => @profesional }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesional.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesionales/1
  # PUT /profesionales/1.xml
  def update
    @profesional = Profesional.find(params[:id])

    respond_to do |format|
      if @profesional.update_attributes(params[:profesional])
        flash[:notice] = 'Profesional actualizado.'
        format.html { redirect_to(@profesional) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesional.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesionales/1
  # DELETE /profesionales/1.xml
  def destroy
    @profesional = Profesional.find(params[:id])
    @profesional.destroy

    respond_to do |format|
      format.html { redirect_to(profesionales_url) }
      format.xml  { head :ok }
    end
  end
end
