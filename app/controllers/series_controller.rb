class SeriesController < ApplicationController
  def index
    @series = Serie.order(created_at: :desc)
    @total_reps = @series.sum(:reps)
  end

  def create
    @serie = Serie.new(serie_params)
    if @serie.save
      redirect_to series_path
    else
      @series = Serie.order(created_at: :desc)
      @total_reps = @series.sum(:reps)
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
