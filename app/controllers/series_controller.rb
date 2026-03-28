class SeriesController < ApplicationController
  def index
    @series_by_day = Serie.order(created_at: :desc).group_by { |s| s.created_at.to_date }
  end

  def create
    @serie = Serie.new(serie_params)
    if @serie.save
      redirect_to series_path
    else
      @series_by_day = Serie.order(created_at: :desc).group_by { |s| s.created_at.to_date }
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    Serie.find(params[:id]).destroy
    redirect_to series_path
  end

  private

  def serie_params
    p = params.expect(serie: [ :reps, :mark ])
    p[:mark] = nil if p[:mark].blank?
    p
  end
end
