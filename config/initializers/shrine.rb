require 'shrine'

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :determine_mime_type, analyzer: :marcel
Shrine.plugin :validation_helpers
Shrine.plugin :derivatives

class Shrine::Attacher
  def promote(*)
    create_derivatives
    # creates automatically and preserves
    # usual :versions plugin behaviour
    super
  end
end

if Rails.env.test?
  require 'shrine/storage/memory'

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require 'shrine/storage/file_system'

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
  }
end
