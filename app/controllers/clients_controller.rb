class ClientsController < ApplicationController
  before_action :logged_in_user
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = current_user.clients
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = current_user.clients.build
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = current_user.clients.build(client_params)

    respond_to do |format|
      if @client.save
        flash[:success] = 'Client was successfully created.'
        format.html { redirect_to @client}
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        flash[:success] = 'Client was successfully updated.'
        format.html { redirect_to @client}
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      flash[:success] = 'Client was successfully deleted.'
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def bill
    @client = current_user.clients.find(params[:id])
    if @client.events.where(billed: nil).any?
      total_amount = 0

      invoice = Invoice.new(user: current_user, client: @client)

      @client.events.where(billed: nil).each do |e|
        amount = ((e.end - e.start) / 1.hour).round * @client.tariff
        invoice.services.build(title: e.title, description: e.description, start_time: e.start,
                               end_time: e.end, amount: amount)
        total_amount += amount
        e.update(billed: true)
      end

      invoice.total_amount = total_amount
      invoice.issue_date = Time.now

      respond_to do |format|
        if invoice.save
          format.json { render :show, status: :created, location: invoice }
        else
          format.json { render json: invoice.errors, status: :unprocessable_entity }
        end
      end
      end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = current_user.clients.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :tariff, :user_id)
    end
  end

