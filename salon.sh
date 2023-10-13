#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

ALL_SERVICES=$($PSQL "SELECT service_id, name FROM services;")

RUN() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "$ALL_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\nEnter the service number"
  read SERVICE_ID_SELECTED

  if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    RUN "Select a number from the services"
  else
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    if [[ -z $SERVICE_ID ]]
    then
      RUN "We do not offer the service you selected"
    else
      echo "Enter your phone number"
      read CUSTOMER_PHONE

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      
      if [[ -z $CUSTOMER_ID ]]
      then 
        echo "Whats your name?"
        read CUSTOMER_NAME

        echo $CUSTOMER_NAME

        CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      fi

      echo "Enter a time for your appointment"
      read SERVICE_TIME

      APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")

      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

RUN "Welcome, select a service to book an appointment"

