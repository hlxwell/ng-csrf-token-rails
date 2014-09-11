# REAME

1. Copy ng-csrf-token-rails.js.coffe to your assets

2. Add "ng-csrf-token-rails" to angular.module dependency list.

3. When login or logout, should return new CSRF token through API.

```
app.controller "SigninController", (CsrfTokenRails) ->
  Session.signout().then (data) ->
    CsrfTokenRails.updateToken(data.newCsrf)

  Session.signin(params).then (data) ->
    CsrfTokenRails.updateToken(data.newCsrf)
```