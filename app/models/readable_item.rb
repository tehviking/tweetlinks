class ReadableItem
  attr_accessor :content, :title, :domain, :author, :url
  def initialize(url)
    @url = url
    get_readable_content
  end

  def get_readable_content
    if url =~ /(\.gif|\.jpg|\.jpeg|\.png)$/
      self.content = "<img src=\"#{url}\"/>"
    else
      request = HTTParty.get("http://www.readability.com/api/content/v1/parser?url=#{url}&token=#{ENV["READABILITY_PARSER_KEY"]}")
      readability_response = request.parsed_response
      self.content = readability_response["content"]
      self.domain = readability_response["domain"]
      self.title = readability_response["title"]
      self.author = readability_response["author"]
    end
  end
end