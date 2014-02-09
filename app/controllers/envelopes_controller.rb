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
    @envelope.denominations.destroy_all
    remaining = @envelope.additional_amount
    while remaining > 0 do
      if remaining >= 20
        remaining -= 20
        @envelope.denominations << Twenty.create
      elsif remaining >= 10
        remaining -= 10
        @envelope.denominations << Ten.create
      elsif remaining >= 5
        remaining -= 5
        @envelope.denominations << Five.create
      else
        remaining -= 1
        @envelope.denominations << One.create
      end
    end
    @envelope.save
  end
end
