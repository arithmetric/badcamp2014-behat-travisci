# Drupal 7/Behat/Travis CI demo for BAD Camp 2014

Code Status (master branch):
<a href="https://travis-ci.org/arithmetric/badcamp2014-behat-travisci"><img src="https://travis-ci.org/arithmetric/badcamp2014-behat-travisci.svg?branch=master"></a>

DESCRIPTION
-----------

The Drupal 7 Behat Travis CI Demo shows how to use Behat and Travis
to set up a system to continuously run BDD tests on incremental changes
to a base Drupal 7 core system.  This can be extended to work with an
existing Drupal site.  With the addition of more tests that are tailored
to the site, this could be used to test newly deployed code, minor
updates of Drupal Core and Contrib modules, and so on.


GETTING STARTED
---------------

This repository comes with nearly everything that you need to get
started.  You will need to have a database pre-installed.

For a quick start, to install locally to see if the tests work
right, consider using sqlite.  The install_drupal_sqlite.sh script
will set up your system using sqlite; requires sqlite to be pre-installed.

When setting up to run on Travis, use the install_drupal_mysql.sh script.
This script assumes that mysql is pre-installed, and has a user 'root' with
no password.  Travis comes pre-configured like this, so you should be
able to just run the script and go.

Note that Selinium is not used or installed by this project.  You might
want to install it later if you want to do any JavaScript testing; however,
you will still be able to use "click on this button" style tests using
the Goutte tool, which is installed.


STEP-BY-STEP WITH SQLITE FOR LOCAL USE
--------------------------------------

You can run tests locally if you'd like to see if if the Behat tests are working.

0. Install sqlite if you have not already done so.

1. Optional - if you plan on making your own tests, fork the repository.

2. Clone the repository

3. If you do not have composer installed globally: `curl -s https://getcomposer.org/installer | php`

4. `./composer install`

5. `./bin/install_drupal_sqlite.sh`

6. Confirm that it worked: `./bin/behat -di`

7. In a separate shell: `cd html && drush runserver --server=builtin 8080 --strict=0`

8. Run some tests!  `./bin/behat`


STEP-BY-STEP SETUP ON TRAVIS
----------------------------

Set up your project on Travis, so that it will test every commit.

1. If you have not already forked the repository, do so now.

2. Go to https://travis-ci.org/ in a web browser

3. Click on "Sign in with Github".  Give Travis All The Permissions.

4. Next to the "My Repositories" tab, click on the "+" to add a repository.

5. If you do not see your repository, click the "Sync now" button.

6. Find the fork of badcamp2014-behat-travisci you made, and switch it "On".

7. Travis will automatically run all tests the next time a commit is pushed.


CUSTOMIZE
---------

This project can be used as a template to add Travis Behat testing to
an existing Drupal project.  The pattern supported here is to check out 
the code of your project, install a blank site on top of it, and then run 
behat tests on the fresh site.  Base configuration must be done, and content 
added; this is up to the reader to provide.

1. Copy your Drupal root into the folder 'html' in this project.  Remove
   any existing 'html' folder that may already exist here.

2. In .travis.yml, change `./bin/install_drupal_mysql.sh` to `./bin/install_existing_drupal_mysql.sh`.

3. To test locally, follow the instructions above, but run  `./bin/install_existing_drupal_sqlite.sh`
   in step 4.

4. To test on Travis, follow the instructiong above, "STEP-BY-STEP SETUP ON TRAVIS".
