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
    validate_envelope
  end

  def destroy
    @envelope = Envelope.find(params[:id])
    @envelope.destroy
    @envelopes = Envelope.all
  end

  private

  def validate_envelope
    if @envelope.valid?
      @envelopes = Envelope.all
      determine_denominations
      render :hide_form
    else
      render :show_form
    end
  end

  def envelope_params
    params.require(:envelope)
      .permit(:category, :name, :current_amount, :additional_amount)
  end

  def determine_denominations
    # TODO: Do math do figure out denominations
    reset_denominations
    remaining = @envelope.additional_amount
    while remaining > 0 do
      if remaining >= 20
        remaining -= 20
        @envelope.twenties.first.count_in_envelope += 1 
      elsif remaining >= 10
        remaining -= 10
        @envelope.tens.first.count_in_envelope += 1
      elsif remaining >= 5
        remaining -= 5
        @envelope.fives.first.count_in_envelope += 1
      else
        remaining -= 1
        @envelope.ones.first.count_in_envelope += 1
      end
    end
    @envelope.save
  end
  
  def reset_denominations
    @envelope.denominations.destroy_all
    @envelope.denominations << One.create, Five.create, Ten.create, Twenty.create
  end
end
