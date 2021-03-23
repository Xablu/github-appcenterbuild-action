# Github action to start a build in Appcenter
When you configure an app in appcenter and connect it to Github a webhook is made in Github.
Github however has a hard limit of 20 webhooks, which can be a problem quite fast when you are building whitelabel apps as well.
To work around this limitation, you can use this action.

## Requirements
You have to make sure you have:
- setup and configured the app in appcenter
- you have an app token or user token generated in appcenter (you can add this to the secrets in your github repository)
- setup and configured the branch for which you want to build.

## Usage
The Github workflow is usually declared in .github/workflow/main.yml.

```yaml
on:
  push:
    branches:
      - "main"
  pull_request:
    branches:
      - "main"
name: Workflow name
jobs:
  AppcenterBuildTrigger:
    name: Appcenter Build Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Appcenter trigger
      uses: xablu/github-appcenterbuild-action
      with:
        appcentertoken: ${{ secrets.APPCENTERTOKEN }}
        organization: your organization name in appcenter
        application: the application name in appcenter
        branch: the github branch you want to build
```
Create a secret in you repository's secrets configuration called APPCENTERTOKEN and paste your appcenter token in there as a value.

You can add additional branches or remove branches under the push or pull_request blocks.