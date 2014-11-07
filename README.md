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

3. `./composer install`

4. `./bin/install_drupal_sqlite.sh`

5. Confirm that it worked: `./bin/behat -di`

6. In a separate shell: `cd html && drush runserver --server=builtin 8080 --strict=0`

7. Run some tests!  `./bin/behat`


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
an existing Drupal project that lives in its own repository.  There
are many ways this can be done; this is one possible recipe.

Preconditions:  Presumes you have the following directory layout

www
  mysite
    .git
    .gitignore
    drupal         {{--  YOUR DRUPAL ROOT
      sites
        default    {{--  SETTINGS.PHP NOT CHECKED IN TO REPOSITORY
          files
    private-files
    behat          {{--  NEW FOLDER FOR TRAVIS BEHAT TESTS

1. Clone a fresh copy of this project to get rid of any temporary files

2. Copy all of the files in this project into your site: `cp -R badcamp2014-behat-travisci mysite/behat`

3. Get rid of the .git file from this project: `rm -rf mysite/behat/.git`

4. Move the .travis.yml file to the correct location: `mv mysite/behat/.travis.yml mysite`

5. In .travis.yml, change `./bin/install_drupal_mysql.sh` to `./bin/install_existing_drupal_mysql.sh`

6. In .travis.yml, change `cd html` to `cd drupal` 

7. In behat.yml, change `drupal_root: './html'` to `drupal_root: '../drupal'`

8. If your Drupal root is NOT named `drupal`, then edit `bin/install_existing_drupal_mysql.sh` and set DRUPAL_ROOT as needed.

9. Commit `behat` and `.travis.yml` to your repository.

10. TO TEST LOCALLY:

11. `cd behat`

12. If you do not have composer installed globally: `curl -s https://getcomposer.org/installer | php`

13. `./composer install`

14. `./bin/install_existing_drupal_sqlite.sh`

15. Confirm that it worked: `./bin/behat -di`

16. In a separate shell: `cd ../drupal && drush runserver --server=builtin 8080 --strict=0`

17. Run some tests!  `./bin/behat`

18. To test on Travis, follow the instructiong above, "STEP-BY-STEP SETUP ON TRAVIS".
