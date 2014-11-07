
Feature: Login

  Scenario: Ensure the Login link is available for anonymous users.
    Given I am an anonymous user
     When I am on the homepage
     Then I should see an "input#edit-ame" element
      And I should see an "input#edit-ass" element

  @api
  Scenario: Ensure as a logged in user, I can log out.
    Given I am logged in as a user with the "authenticated user" role
     When I click "Logout"
     Then I should be on the homepage
      And I should see "User login"
