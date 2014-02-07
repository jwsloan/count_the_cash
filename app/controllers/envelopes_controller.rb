class EnvelopesController < ApplicationController
  def show
    @envelopes = Envelope.all
  end

  def new;
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
    determine_denominations
    @envelopes = Envelope.all
    render :hide_form
  end

  def create
    @envelope = Envelope.create(envelope_params)
    determine_denominations
    @envelopes = Envelope.all
    render :hide_form
  end

  private
  def envelope_params
    params.require(:envelope).permit(:category, :name, :current_amount, :additional_amount)
  end

  def determine_denominations
    #TODO: Do math do figure out denominations
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
