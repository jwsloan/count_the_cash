# @author John Sloan
# An Evelope represents a physical cash budgeting envelope.
# This controller will determine the number required of each 
# available denomination based on the amount being added to
# that envelope. Additionally, it will ensure that each user
# only sees the envelopes that user created.
class EnvelopesController < ApplicationController
  def show
    if signed_in?
      @envelopes = Envelope.where(:user_id => current_user.id)
    else
      @envelopes = []
    end
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
    @envelope = Envelope.new(envelope_params)
    validate_envelope
  end

  def destroy
    @envelope = Envelope.find(params[:id])
    @envelope.destroy
    @envelopes = Envelope.where(:user_id => current_user.id)
  end

  private

    # Perform normal .valid? call along with custom validation.
    # Depending on the result, either hide the form, or reshow.
    def validate_envelope
      if validate_no_duplicates_per_user && @envelope.valid?
        @envelope.update_attribute(:user_id, current_user.id)
        determine_denominations!
        @envelopes = Envelope.where(:user_id => current_user.id)
        render :hide_form
      else
        render :show_form
      end
    end

    def envelope_params
      params.require(:envelope)
        .permit(:category, :name, :current_amount, :additional_amount)
    end

    # For each available denomination, do the math to determine how many of
    # each is required for the additional amount being added to the envelope.
    def determine_denominations!
      @remaining = @envelope.additional_amount
      Denomination.available_values.each do |value|
        denomination = choose_denomination value
        count = @remaining / value
        denomination.count_in_envelope = count
        denomination.save
        @remaining -= value * count
      end
      @envelope.save
    end

    # Takes a dollar value, and returns a denomination subclass.
    #
    # @param value [Integer] the dollar value requested
    # @return [Denomination] the subclass of denomination
    def choose_denomination(value)
      case value
      when 20 then Twenty.find_or_create_by(:envelope_id => @envelope.id)
      when 10 then Ten.find_or_create_by(:envelope_id => @envelope.id)
      when 5 then Five.find_or_create_by(:envelope_id => @envelope.id)
      when 1 then One.find_or_create_by(:envelope_id => @envelope.id)
      end
    end
    
    # It does not make sense to have two envelopes with the same name for
    # a single user. This will ensure that does not happen.
    def validate_no_duplicates_per_user
      if @envelope.new_record? && envelope_name_taken?
        @envelope.errors[:name] << "You already have an envelope by that name."
        false
      else
        true
      end
    end

    # Does this user already have an envelope by that name?
    def envelope_name_taken?
      Envelope.exists?(:user_id => current_user.id,
                       :name => @envelope.name)
    end
end
