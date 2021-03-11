### Github action to start a build in Appcenter
When you configure an app in appcenter and connect it to Github a webhook is made in Github.
Github however has a hard limit of 20 webhooks, which can be a problem quite fast when you are building whitelabel apps as well.
To work around this limitation, you can use this action.

You have to make sure you have:
- setup and configured the app in appcenter
- you have an app token or user token generated in appcenter (you can add this to the secrets in your github repository)