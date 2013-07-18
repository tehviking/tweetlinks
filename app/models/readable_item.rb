class ReadableItem < ActiveRecord::Base
  belongs_to :shared_item
  before_create :get_readable_content

  def get_readable_content
    Timeout::timeout(60) do
      if shared_item.url =~ /(\.gif|\.jpg|\.jpeg|\.png)$/
        self.content = "<img src=\"#{shared_item.url}\"/>"
      else
        request = HTTParty.get("http://www.readability.com/api/content/v1/parser?url=#{shared_item.url}&token=#{ENV["READABILITY_PARSER_KEY"]}")
        readability_response = request.parsed_response
        self.content = readability_response["content"]
        self.domain = readability_response["domain"]
        self.title = readability_response["title"]
        self.author = readability_response["author"]
      end
    end
  end
end