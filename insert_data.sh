#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "TRUNCATE TABLE games, teams"

function add_team() {
  # Check for team in database
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")
  if [[ -z $TEAM_ID ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$1')"
  fi
}

while IFS=, read -r YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    add_team "$WINNER"
    add_team "$OPPONENT"

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)"
  fi
done < games.csv