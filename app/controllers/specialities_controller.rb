# frozen_string_literal: true

class SpecialitiesController < ApplicationController
  def index
    specialities = Speciality.all

    render json: specialities.to_json(only: %i[id speciality])
  end
end
