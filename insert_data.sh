#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"

  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
   do
       # if we are not reading the first line of the file. 
       if [[ $YEAR != year ]] 
       then
            # 1. get winner id 
            WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

             # if not found 
            if [[ -z $WINNER_ID ]]
            then
                  # insert the team
                  WINNING_TEAM_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
                  if [[ $WINNING_TEAM_INSERT_RESULT == 'INSERT 0 1' ]]
                  then
                        # get the id
                        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
                  fi
            fi 

          #2. get opponent_id
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
          # if not found
          if [[ -z $OPPONENT_ID ]]
          then
                # insert the team
                OPPOSING_TEAM_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
                if [[ $OPPOSING_TEAM_INSERT_RESULT == 'INSERT 0 1' ]]
                then
                      # get the id
                      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
                fi
          fi

          # 3. get the game information
          # first make sure that the game is not already in the database by querying its game_id

          GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID")

          # if it is in the database, exit.
          if [[ -z $GAME_ID ]]
          then
                # insert it
                INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES ($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
                # if it is inserted, pass a message to the terminal
                if [[ $INSERT_GAME_RESULT != 'INSERT 0 1' ]]
                then
                      # pass an error message
                      echo Error inserting game data.
                fi
          fi
       fi
   done

else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

   cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
   do
       # if we are not reading the first line of the file. 
       if [[ $YEAR != year ]] 
       then
            # 1. get winner id 
            WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

             # if not found 
            if [[ -z $WINNER_ID ]]
            then
                  # insert the team
                  WINNING_TEAM_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
                  if [[ $WINNING_TEAM_INSERT_RESULT == 'INSERT 0 1' ]]
                  then
                        # get the id
                        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
                  fi
            fi 

          #2. get opponent_id
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
          # if not found
          if [[ -z $OPPONENT_ID ]]
          then
                # insert the team
                OPPOSING_TEAM_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
                if [[ $OPPOSING_TEAM_INSERT_RESULT == 'INSERT 0 1' ]]
                then
                      # get the id
                      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
                fi
          fi

          # 3. get the game information
          # first make sure that the game is not already in the database by querying its game_id

          GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID")

          # if it is in the database, exit.
          if [[ -z $GAME_ID ]]
          then
                # insert it
                INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES ($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
                # if it is inserted, pass a message to the terminal
                if [[ $INSERT_GAME_RESULT != 'INSERT 0 1' ]]
                then
                      # pass an error message
                      echo Error inserting game data.
                fi
          fi
       fi
   done
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
