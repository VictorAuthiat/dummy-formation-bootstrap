class BaseUploader < Shrine
  MAX_FILESIZE = 7.megabytes

  def self.human_max_size
    MAX_FILESIZE.fdiv(1_000_000).round
  end
end
