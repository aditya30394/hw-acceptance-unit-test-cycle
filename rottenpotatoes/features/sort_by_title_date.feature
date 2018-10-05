Feature: display a list of movies sorted by title or release date
 
  As a movie fan
  So that I can select movies based on my preference
  I want to see movies in sorted order by title or release date

Background: movies in database
  
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

  And I am on the RottenPotatoes home page

Scenario: sort movies by their title
  Given I am on the home page
  # used web_step
  When I follow "Movie Title"
  Then I should see "Alien" before "The Help"

Scenario: sort movies in increasing order of release date
  Given I am on the RottenPotatoes home page
  # used web_step
  When I follow "Release Date"
  Then I should see "Star Wars" before "When Harry Met Sally"