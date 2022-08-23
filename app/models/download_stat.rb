class DownloadStat < ApplicationRecord
  scope :filter_by_package, -> (package) { where package: package if package.present? }
  scope :filter_by_version, -> (version) { where version: version if version.present? }
  scope :filter_by_start_date, -> (startDate) { where("date >= ?", Date.parse(startDate)) if startDate.present? }
  scope :filter_by_end_date, -> (endDate) { where("date <= ?", Date.parse(endDate)) if endDate.present? }
  # scope :filter_by_start_date, -> (startDate) { where('date >= ?', startDate), startDate if startDate.present? }
  # scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}

  # scope :filter_by_end_date, -> (endDate) { where date: 'date <= ?', endDate if endDate.present? }

  # def self.filter_by_date(startDate, endDate)
  #   self.filter_by_start_date(startDate).filter_by_date(endDate)
  # end
end
