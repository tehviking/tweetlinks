class LinkSerializer < BaseSerializer
  attributes :id, :tweet_uid, :url, :tweet_body, :creator_username, :creator_uid, :param

  def param
    id
  end
end
