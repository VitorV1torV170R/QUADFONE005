class HelloController < ApplicationController
    def world
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    end
  end
