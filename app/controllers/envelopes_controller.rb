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
    @remaining = @envelope.additional_amount

    [20, 10, 5, 1].each do |value|
      t = case value
          when 20 then Twenty.find_or_create_by(:envelope_id => @envelope.id)
          when 10 then Ten.find_or_create_by(:envelope_id => @envelope.id)
          when 5 then Five.find_or_create_by(:envelope_id => @envelope.id)
          when 1 then One.find_or_create_by(:envelope_id => @envelope.id)
          end
      count = @remaining / value
      t.count_in_envelope = count
      t.save
      @remaining -= value * count
    end
    @envelope.save
  end
end

