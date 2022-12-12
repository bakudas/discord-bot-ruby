# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

# Get data from api from a given url endpoint
class GetData
  attr_reader :url, :raw_data, :response, :status

  def initialize(api_url)
    # setup instance variables
    @url = api_url
    @response ||= {}
    @status ||= ' '

    @raw_data = request(@url) # get raw data from get api request

    return unless @status == '200' # return unless status is successfully

    @response = parse(raw_data) # parse json data as Hash
  end

  # Get data from api
  def request(url)
    @url = URI(url)

    https = Net::HTTP.new(@url.host, @url.port)

    https.use_ssl = true

    request = Net::HTTP::Get.new(@url)

    @status = https.request(request).code

    https.request(request).read_body
  end

  # Parse json data as Hash
  def parse(raw_data = nil)
    JSON.parse(raw_data)
  end

  # Check object Type
  def ==(other)
    self.eql?other
  end
end