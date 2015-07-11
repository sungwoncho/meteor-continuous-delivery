# Meteor Continuous Delivery [![Build Status](https://travis-ci.org/sungwoncho/meteor-continuous-delivery.svg?branch=master)](https://travis-ci.org/sungwoncho/meteor-continuous-delivery)

A sample meteor app using TravisCI for continuous delivery, with test running on
velocity and mocha.

It uses [Meteor Up](https://github.com/arunoda/meteor-up) to deploy to a server
whenever a build passes on `prod` branch.

## Use in your app

Copy `.travis.yml` to your app.

Meteor up uses `mup.json` and `settings.json`. If you are using a private key for
authentication, it needs your pem file.

Compress those files:

    tar cvf secrets.tar mup.json settings.json private_key

Encrypt `secrets.tar` to `secrests.tar.enc`:

    travis encrypt-file secrets.tar

Replace the decrypt script in `.travis.yml` with the one given by the previous command.

## Customize branch to deploy

If you want to deploy from a branch other than `prod`, just copy `deploy.sh` to
your app and change `prod` to something else.

Change the `after_success` script in your `.travis.yml` to run your deploy.sh (e.g. `./deploy.sh`).
Make sure it is executable. Run `chmod +x deploy.sh`.

## Note

* If you follow the previous steps, all secret files (`mup.json`, `settings.json`, `private_key`)
will live in the app root directory.

This means that you need to set `"pem"` and `"app"` config in your `mup.json` accordingly.

```
...
  "pem": "private_key",
...
  "app": ".",
...
```

Configure otherwise depending on your need.

* If not using `settings.json`, you don't need to specify `--settings settings.json`
in `script` in your `.travis.yml`.

## Contributing

Feel free to open a pull request if something becomes outdated.
