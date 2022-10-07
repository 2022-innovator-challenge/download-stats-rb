class DownloadStatsController < ApplicationController
  def index
    params = filter_params
    # filter_params
    if (params.empty?)
      @stats = DownloadStat.all
    else
      stats = DownloadStat.all
      if (params[:package])
        stats = DownloadStat.none
        (params[:package]).each { |packageAndVersion|
          package, version = packageAndVersion.split(/(?<!^)@/)
          stats = stats.or(DownloadStat.filter_by_package(package).filter_by_version(version))
        }
      end
      @stats = stats.and(DownloadStat.filter_by_start_date(params[:startDate]).filter_by_end_date(params[:endDate]))
    end
    # debugger
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
    if DownloadStat.destroy(params[:id])
      @stats = DownloadStat.all
      render json: @stats
    else 
      render json: { error: 'Could not delete download stats.' }, status: 400
    end
  end

  def bulk_destroy
    if DownloadStat.destroy(params["_json"])
      @stats = DownloadStat.all
      render json: @stats
    else 
      render json: { error: 'Could not delete download stats.' }, status: 400
    end
  end

  private

  def filter_params(parameters = params)
    if params[:package].kind_of?(String)
      parameters = parameters.merge({:package => [parameters[:package]]}) 
    end
    parameters.permit(:startDate, :endDate, :package, :package => [])
  end

  def stat_params(parameters = params)
    parameters.require([:package, :version, :downloads])
    parameters.with_defaults({:date => Time.now}).permit(:package, :version, :downloads, :date)
  end
end
