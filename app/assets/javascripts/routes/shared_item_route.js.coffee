App.SharedItemRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    App.SharedItem.find(params.shared_item_id)