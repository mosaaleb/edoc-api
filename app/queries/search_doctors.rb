# frozen_string_literal: true

class SearchDoctors
  attr_accessor :initial_scope, :search_params

  def self.call(initial_scope, search_params)
    new(initial_scope, search_params).call
  end

  def initialize(initial_scope, search_params)
    @initial_scope = initial_scope
    @search_params = search_params
  end

  def call
    scoped = filter_by_speciality(initial_scope, search_params[:speciality])
    scoped = filter_by_name(scoped, search_params[:name])
    scoped = filter_by_fees(scoped,
                            search_params[:fees_from],
                            search_params[:fees_to])
    filter_by_years_of_experience(scoped,
                                  search_params[:experience_from],
                                  search_params[:experience_to])
  end

  private

  def filter_by_speciality(scoped, speciality = nil)
    speciality ? scoped.special_in(speciality) : scoped
  end

  def filter_by_name(scoped, name = nil)
    name ? scoped.search_with_name(name) : scoped
  end

  def filter_by_fees(scoped, from = nil, to = nil)
    from ? scoped.where(fees: from..to) : scoped
  end

  def filter_by_years_of_experience(scoped, from = nil, to = nil)
    from ? scoped.where(years_of_experience: from..to) : scoped
  end
end
