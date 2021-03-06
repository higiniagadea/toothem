class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml

  layout 'default'

  def index
    @items = Item.paginate :page=> params[:page], :per_page=>15

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
   
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    
    @item = Item.new(params[:item])
   
    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item creado.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :layout => 'default'}
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])
    params[:item][:estatico] 

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item actualizado.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])

    if @item.estatico == true
      flash[:notice] = 'El item no puede ser borrado, ya que es estatico'
    else
    @item.destroy
    end
    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  
end
