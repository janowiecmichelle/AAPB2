require 'open-uri'
require 'caption_converter'

class CaptionFile
  URL_BASE = 'https://s3.amazonaws.com/americanarchive.org/captions'.freeze

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def srt
    @srt ||= open(CaptionFile.srt_url(id)).read
  end

  def vtt
    @vtt ||= CaptionConverter.srt_to_vtt(srt)
  end

  def html
    @html ||= CaptionConverter.srt_to_html(srt)
  end

  def self.srt_url(id)
    "#{CaptionFile::URL_BASE}/#{id}/#{srt_filename(id)}".gsub('cpb-aacip_', 'cpb-aacip-')
  end

  def self.srt_filename(id)
    "#{id}.srt1.srt"
  end
end
