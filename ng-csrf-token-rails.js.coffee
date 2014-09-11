csrf = angular.module('ng-csrf-token-rails', [])

csrf.run(['CsrfTokenRails', (CsrfRails) ->
  CsrfRails.updateToken()
])

csrf.factory 'CsrfTokenRails', [
  'Restangular', '$http',
  (Restangular,  $http) ->

    _setRequestToken = (token) ->
      # update $http, Restangular csrf token
      Restangular.setDefaultHeaders { "X-CSRF-TOKEN": token }
      $http.defaults.headers.common['X-CSRF-Token'] = token

    # update meta tag csrf value
    _updateMetaTagData = (token) ->
      el = document.querySelector('meta[name="csrf-token"]')
      el.setAttribute('content', token) if el

    _getToken = ->
      el = document.querySelector('meta[name="csrf-token"]')
      el.getAttribute('content') if el

    _updateToken = (token) ->
      token = if _.isUndefined(token) then _getToken() else token
      _setRequestToken(token)
      _updateMetaTagData(token)

    {
      getToken: _getToken
      updateToken: _updateToken
    }
]

