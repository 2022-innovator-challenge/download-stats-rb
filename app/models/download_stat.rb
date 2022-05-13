class DownloadStat < ApplicationRecord

# require 'redis'
# $redis = Redis.new


# class DownloadStat
#   include ActiveModel::API

#   attr_accessor :package, :version, :downloads
#   validates :package, :version, :downloads, presence: true
#   # def initialize(stat_params)
#   #   @package, @version, @downloads = stat_params[:package], stat_params[:version], stat_params[:downloads]
#   #   Rails.logger.info @package
#   #   Rails.logger.info @version
#   #   Rails.logger.info @downloads
#   # end

#   def self.all
#     $redis.lrange("downloadstats", 0, -1)
#   end

#   def save
#     puts self.to_model
#     puts self.to_param
#     puts self.to_json
#     $redis.rpush("downloadstats", self.to_json)
#   end

#   # def to_json
#   #   hash = { 'a' => 1, 'b' => 2 }
#   # end
end
