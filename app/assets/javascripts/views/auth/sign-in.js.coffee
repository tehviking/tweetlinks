Tweetlinks.AuthSignInView = Em.View.extend
  templateName: 'auth/sign-in'

  email:    null
  password: null

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    Tweetlinks.Auth.signIn
      data:
        email:    @get 'email'
        password: @get 'password'