# Drupal 7/Behat/Travis CI Demo for BAD Camp 2014

Code Status (master branch):
<a href="https://travis-ci.org/arithmetric/badcamp2014-behat-travisci"><img src="https://travis-ci.org/arithmetric/badcamp2014-behat-travisci.svg?branch=master"></a>

## Description

The Drupal 7/Behat/Travis CI Demo is an example of using Travis CI as a
continuous integration environment that runs Behat behavioral test cases when
changes are committed (or pull requests are opened) for a Drupal 7 project.

This approach can be used to test a single module, a set of modules or a
distribution, or an entire Drupal site. Regardless of what you want to test,
Behat requires a working Drupal site, so this repo provides a script for
setting up a plain copy of the Drupal 7 standard install.

This repo is meant as a starting point for experimenting with Drupal, Behat,
and Travis CI. Follow the "Getting Started" instructions below, and then try
the following activities:

- Modify the included login test scenario in the "features" directory to cause
them to fail, then fix them again.

- Add a new test scenario to verify other Drupal core functionality.

- Add a contrib or custom module, then add test scenarios to verify features
provided by the module.


## Getting Started

This repository comes with nearly everything that you need to get started with
Travis and Behat. However, you will need to satisfy Drupal's requirements,
including having a database (preferably MySQL or SQLite) installed.

For a quick start, consider using SQLite, which does not require the database
and user to be preconfigured.


### Setting Up On Your Local

Before running tests on Travis CI, you'll want to set up the Drupal project
locally to verify changes before committing them or sending a pull request.
Follow these steps to set up the Drupal project:

1. Install and configure the database for Drupal.

    For MySQL, create a database named "drupal" and ensure the "root" user has
    access to the database with an empty password.
    
    For SQLite, no configuration is required.

2. Fork this repository, then clone your forked copy.

3. If you do not have *composer* installed globally, download a local copy by
using: `curl -s https://getcomposer.org/installer | php`

4. Run *composer install*, either using the local copy (`./composer install`)
or the global copy (`composer install`).

5. Use the included install script for your chosen database:

    For MySQL, use: `./bin/install_drupal_mysql.sh`
    
    For SQLite, use: `./bin/install_drupal_sqlite.sh`

6. To confirm that it worked, ensure that the following command outputs a
number of available test steps: `./bin/behat -di`


### Running Tests On Your Local

Once your Drupal site is working locally, you can run Behat tests against it.

1. Ensure the site is accessible at http://localhost:8080. You can use *drush*
as a simple webserver by running:
`cd html && drush runserver --server=builtin 8080 --strict=0`

2. Run the included tests using Behat by running: `./bin/behat`


### Running Tests on Travis CI

After forking this repository, you can configure Travis CI to run tests when
you commit changes (or issue a pull request). To set up Travis CI with your
forked repo, do the following:

1. Start at the Travis CI homepage at https://travis-ci.org/

2. Click on "Sign in with Github" and grant Travis CI access to your account.

3. Click on the "+" next to the "My Repositories" tab to set up your fork.

4. Find your fork of badcamp2014-behat-travisci, and switch it to "On". If you
do not see your fork yet, click the "Sync now" button.

5. Commit a change to your fork and watch Travis run tests against it.


## Configuring Behat

This repository includes a behat.yml that configures Behat to use the Goutte web
driver for basic front end testing in a "headless" browser. Goutte does not
support JavaScript, so you may want to enable another web driver, like Selenium
or Zombie.js.

The Behat configuration enables the Drupal API driver, which allows full testing
functionality, including creating test content and cleaning it up, creating test
users, etc. This driver requires that Behat tests are run in the same
environment as Drupal is installed. If you wish to run tests against another
environment, you will need to change the Behat configuration to use either the
Drush or Blackbox driver.

For more information on these driver options, see:
http://behat-drupal-extension.readthedocs.org/en/master/drivers.html


## Adding Your Own Test Cases

This repository includes a simple test feature for login and logout
functionality. You may add your own test features and modify the included login
feature to test the more critical functionality of your site.


## Adding Your Own Code

This project can be used as a template to add Behat testing run by Travis CI to
an existing Drupal project. The pattern supported here is to check out the code
of your project, perform a Drupal site install on top of it, and then run Behat
tests against the fresh site. Configuring the site appropriately and creating
content is left to the user.

1. Copy your Drupal root into the folder `html` in this project. (Replace the
`html` directory included with this repository.)

2. In .travis.yml, change `./bin/install_drupal_mysql.sh` to:
`./bin/install_existing_drupal_mysql.sh`.

3. To test locally, follow the instructions above, but run
`./bin/install_existing_drupal_sqlite.sh` instead of
`./bin/install_drupal_sqlite.sh`.

4. To test on Travis CI, follow the instructions under "Running Tests on Travis
CI".
