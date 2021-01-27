class FileUploader < BaseUploader
  VALID_EXTENSIONS = %w[pdf ppt pptx doc docx xls xlsx txt].freeze

  plugin :validation_helpers, default_messages: {
    max_size: proc { I18n.t('invalid_file_size', max: human_max_size) },
    extension_inclusion: ->(list) { I18n.t('invalid_file_type', list: list) }
  }

  Attacher.validate do
    validate_max_size(MAX_FILESIZE)
    validate_extension_inclusion(VALID_EXTENSIONS)
  end
end
