class ImageUploader < BaseUploader
  VALID_EXTENSIONS = %w[png jpg jpeg PNG JPG JPEG].freeze
  VALID_MIME_TYPES = %w[image/jpg image/jpeg image/png].freeze

  plugin :validation_helpers, default_messages: {
    max_size: proc { I18n.t('invalid_file_size', max: human_max_size) },
    mime_type_inclusion: ->(list) { I18n.t('invalid_file_type', list: list) },
    extension_inclusion: ->(list) { I18n.t('invalid_file_type', list: list) }
  }

  Attacher.derivatives do |original|
    pipeline = ImageProcessing::MiniMagick.source(original)

    {
      square: pipeline.resize_to_fill!(300, 300),
      large: pipeline.resize_to_fill!(800, 400)
    }
  end

  Attacher.validate do
    validate_max_size(MAX_FILESIZE)
    validate_extension_inclusion(VALID_EXTENSIONS)
    validate_mime_type_inclusion(VALID_MIME_TYPES)
  end
end
