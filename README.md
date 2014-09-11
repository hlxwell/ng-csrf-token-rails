# REAME

Add "ng-csrf-token-rails" to angular.module dependency list.

When login or logout, should return new CSRF token through API.

```
app.controller "SigninController", (CsrfTokenRails) ->
  Session.signout().then (data) ->
    CsrfTokenRails.updateToken(data.newCsrf)

  Session.signin(params).then (data) ->
    CsrfTokenRails.updateToken(data.newCsrf)
```