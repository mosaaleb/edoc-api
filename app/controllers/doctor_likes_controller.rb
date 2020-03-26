# frozen_string_literal: true

class DoctorLikesController < ApplicationController
  def create
    current_user.likes(doctor)
    head :ok
  end

  def destroy
    current_user.dislikes(doctor)
    head :ok
  end

  private

  def doctor
    @doctor ||= Doctor.find(params[:id])
  end
end
