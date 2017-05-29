class TimesController < ApplicationController
  def main
  	@t = Time.now
  	#render text: t
  end
end
