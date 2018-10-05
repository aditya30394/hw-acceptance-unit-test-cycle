Feature: display list of movies filtered by rating
 
  As a parent
  So that I can filter movies appropriate for my family
  I want to see list of movies matching only certain ratings

Background: movies have been added to database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  | Aladdin                 | G      |Ron Clements  | 25-Nov-1992  |
  | The Terminator          | R      |              | 26-Oct-1984  |
  | When Harry Met Sally    | R      |              | 21-Jul-1989  |
  | The Help                | PG-13  |              | 10-Aug-2011  |

Scenario: limit the list of movies to the one with 'PG' or 'R' ratings
  Given I am on the RottenPotatoes homepage
  When I check the following ratings: PG, R
  And I uncheck the following ratings: G, PG-13, NC-17
  And I press "ratings_submit"
  Then I should see "Blade Runner"
  And I should see "Star Wars"
  And I should see "The Terminator"
  And I should not see "Aladdin"

Scenario: all ratings selected
  Given I am on the RottenPotatoes homepage
  When I check the following ratings: PG, R, G, PG-13, NC-17
  And I press "ratings_submit"
  Then I should see all the movies