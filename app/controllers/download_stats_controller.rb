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

  private

  def stat_params
    params.require(:download_stat).permit(:package, :version, :downloads)
  end
end
