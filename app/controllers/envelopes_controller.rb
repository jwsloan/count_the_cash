# @author John Sloan
# Holds cash denominations per budget category
class EnvelopesController < ApplicationController
  def show
    @envelopes = Envelope.all
  end

  def new
    @envelope = Envelope.new
    render :show_form
  end

  def edit
    @envelope = Envelope.find(params[:id])
    render :show_form
  end

  def update
    @envelope = Envelope.find(params[:id])
    @envelope.update_attributes(envelope_params)
    validate_envelope
  end

  def create
    @envelope = Envelope.create(envelope_params)
    init_denominations!
    validate_envelope
  end

  def destroy
    @envelope = Envelope.find(params[:id])
    @envelope.destroy
    @envelopes = Envelope.all
  end

  #private

  def validate_envelope
    if @envelope.valid?
      @envelopes = Envelope.all
      determine_denominations!
      render :hide_form
    else
      render :show_form
    end
  end

  def envelope_params
    params.require(:envelope)
      .permit(:category, :name, :current_amount, :additional_amount)
  end

  def determine_denominations!
    # TODO: Do math do figure out denominations
    @remaining = @envelope.additional_amount
    #while @remaining > 0 do
     # if @remaining >= 20
     #   num = @remaining / 20
     #   @remaining -= 20 * num
     #   t = Twenty.find_by(:envelope_id => @envelope.id)
     #   t.count_in_envelope = num
     #   t.save
      fill_denomination 20
      puts ">>>>>>>>>>remaining: #{@remaining}"
      fill_denomination 10
      puts ">>>>>>>>>>remaining: #{@remaining}"
      fill_denomination 5
      puts ">>>>>>>>>>remaining: #{@remaining}"
      fill_denomination 1
      puts ">>>>>>>>>>remaining: #{@remaining}"
    #end
    @envelope.save
  end
  
  def fill_denomination(value)
    if @remaining >= value
      t = case value
          when 20 then Twenty.find_by(:envelope_id => @envelope.id)
          when 10 then Ten.find_by(:envelope_id => @envelope.id)
          when 5 then Five.find_by(:envelope_id => @envelope.id)
          when 1 then One.find_by(:envelope_id => @envelope.id)
          end
      count = @remaining / value
      t.count_in_envelope = count
      t.save
      @remaining -= value * count
    end
  end

  def init_denominations!
    @envelope.denominations << One.create
    @envelope.denominations << Five.create
    @envelope.denominations << Ten.create
    @envelope.denominations << Twenty.create
  end
end
