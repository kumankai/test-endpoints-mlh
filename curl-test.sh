#!/bin/bash

URL="http://127.0.0.1:5000/api/timeline_post"

function post_test {
  local response=$(curl -s -X POST -d "name=test&email=test@example.com&content=Hello" "$URL")
  local id=$(echo "$response" | jq -r '.id')
  echo "$id"
}

function get_test {
  local response=&(curl "$URL")
  echo "$response"
}

function delete_test {
  local id="$1"
  curl -s -X DELETE "$URL/$id"
}

echo "Running POST request..."
id=$(post_test)
echo -e "POST request successful. ID: $id\n"

echo "Running GET request..."
get_reponse=$(get_test)
echo -e "$get_response\n"

echo "Running DELETE request with ID: $id..."
delete_test "$id"
