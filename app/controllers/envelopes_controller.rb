class EnvelopesController < ApplicationController
  def new;
    @envelope = Envelope.new
  end
end
