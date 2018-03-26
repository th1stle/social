class BookingsController < ApplicationController
  #The set_booking method is called before running the show,edit,update and destroy
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  #Below action forces user to login before they can edit, update or destroy booking
  before_filter :authorize, except: [:index, :show]
  
  
  

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    #authorize @bookings, :index?
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])
    #authorize @bookings, :show?
  end

  # GET /bookings/new
  def new
  @booking = Booking.new
  #authorize @booking, :new?
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
      
      # Tells user that record doesnt exist and routes them back to booking path
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "The page you just requested does not exist"
        redirect_to bookings_path
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:idnumber, :firstname, :lastname, :phone, :bookingfor, :socialclubname, :socialclublocation)
    end
    

end
