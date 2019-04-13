class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show, :edit, :update, :destroy]
  require 'yahoo_client'

  # GET /connections
  # GET /connections.json
  def index
  end

  # GET /connections/1
  # GET /connections/1.json
  def show
    @yahoo_client = YahooAPI.new(@connection)
    @connection
    @data = yahoo_client.get_league
  end

  # GET /connections/new
  def new
  end

  # GET /connections/1/edit
  def edit
  end

  # POST /connections
  # POST /connections.json
  def create
  end

  # PATCH/PUT /connections/1
  # PATCH/PUT /connections/1.json
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to @connection, notice: 'Connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html { render :edit }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1
  # DELETE /connections/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection
      @connection = Connection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connection_params
      params.require(:connection).permit(:access_token, :refresh_token, :token)
    end
end
