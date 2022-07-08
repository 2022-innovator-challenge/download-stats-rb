class DownloadStatsController < ApplicationController
  def index
    @stats = DownloadStat.all
    render json: @stats
  end

  def show
    @stat = DownloadStat.find(params[:id])
    render json: @stat
  end

  def create
    @stat = DownloadStat.new(stat_params)
    if @stat.save
      render json: @stat
    else
      render json: { error: 'Could not save download stats.' }, status: 400
    end
  end

  def bulk_create
    if DownloadStat.insert_all(params["_json"].collect { |item| stat_params(item) })
      @stats = DownloadStat.all
      render json: @stats
    else
      render json: { error: 'Could not save download stats.' }, status: 400
    end
  end

  def destroy
    @stat = DownloadStat.find(params[:id])
    if @stat.destroy
      @stats = DownloadStat.all
      render json: @stats
    else 
      render json: { error: 'Could not delete download stats.' }, status: 400
    end
  end

  private

  def stat_params(parameters = params)
    parameters.require([:package, :version, :downloads])
    parameters.reverse_merge({:date => Time.now}).permit(:package, :version, :downloads, :date)
  end
end
