class UserSerializer < BaseSerializer
  attributes :id, :email, :param

  def param
    id
  end
end
