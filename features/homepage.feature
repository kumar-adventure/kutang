Feature: As a user
  I would like to view all the adverts on the homepage.
  So that I can view the view the offering and contact the seller.

  Scenario: Featured adverts on homepage
    Given website has following adverts:
      | title       | featured |
      | Painting    | true     |
      | Cricket Bat | true     |
      | Design      | false    |
    When I visit the page "home"
    Then I should see following featured adverts:
      | title       |
      | Painting    |
      | Cricket Bat |
  Scenario: Locations drop-down on homepage
    Given website has following location:
      | name      |
      | Delhi     |
      | Ghaziabad |

    When I visit the page "home"
    Then I should see following options to choose from location
      | name      |
      | Delhi     |
      | Ghaziabad |


