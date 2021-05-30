class TableController < ApplicationController
	# before_action :table, only: %i[index show ]
  def index
    file = File.read("db/data.json")
    @elements = JSON.parse(file)
  end

  # GET /tables/1 or /tables/1.json
  def show
	file = File.read("db/data.json")
    	@elements = JSON.parse(file)
  end

  # GET /tables/new
  def new
    @element = elements.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables or /tables.json
  def create
    @element = elements.new(table_params)

    respond_to do |format|
      if @element.save
        format.html { redirect_to @element, notice: "Table was successfully created." }
        format.json { render :show, status: :created, location: @element }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1 or /tables/1.json
  def update
    respond_to do |format|
      if @element.update(table_params)
        format.html { redirect_to @table, notice: "Table was successfully updated." }
        format.json { render :show, status: :ok, location: @element }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1 or /tables/1.json
  def destroy
    @element.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: "Table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @element = elements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.fetch(:element, {})
    end
end



