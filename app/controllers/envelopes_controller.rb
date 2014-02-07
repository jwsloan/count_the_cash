class EnvelopesController < ApplicationController
  def show
    @envelopes = Envelope.all
  end

  def new;
    @envelope = Envelope.new
  end

  def create
    @envelope = Envelope.create(envelope_params)
    @envelopes = Envelope.all
    #TODO: Do math do figure out denominations
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

  private
  def envelope_params
    params.require(:envelope).permit(:category, :name, :current_amount, :additional_amount)
  end
end
