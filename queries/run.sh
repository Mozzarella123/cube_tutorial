host=cube
port=4000
loadUrl=cubejs-api/v1/load
readyzUrl=readyz

token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoib3BlcmF0b3IiLCJpYXQiOjE2Mjg3NDUwNDUsImV4cCI6MTgwMTU0NTA0NX0.VErb2t7Bc43ryRwaOiEgXuU5KiolCT-69eI_i2pRq4o


# Wait for the Cube API to become ready
until curl -s "$host":"$port"/"$readyzUrl"  > /dev/null; do
  sleep 1
done

# Wait for the database to become ready
until nc -z -v -w30 database 3306
do
  echo "Waiting for database connection..."
  # wait for 5 seconds before check again
  sleep 5
done

query=$(cat query/queries/countMissed.json)
curl "$host":"$port"/"$loadUrl" -H "Authorization: ${token}" -G -s --data-urlencode "query=${query}" -o countMissedResponse.json

echo "Кол-во пропущенных"
jq ".data" countMissedResponse.json

query=$(cat query/queries/employees.json)
curl "$host":"$port"/"$loadUrl" -H "Authorization: ${token}" -G -s --data-urlencode "query=${query}" -o employeesResponse.json

echo "Сотрудники"
jq ".data" employeesResponse.json

query=$(cat query/queries/countMissedEmployees.json)
curl "$host":"$port"/"$loadUrl" -H "Authorization: ${token}" -G -s --data-urlencode "query=${query}" -o countMissedEmployeesResponse.json

echo "Пропущенные по сотрудникам"
jq ".data" countMissedEmployeesResponse.json

query=$(cat query/queries/avgDurationEmployees.json)
curl "$host":"$port"/"$loadUrl" -H "Authorization: ${token}" -G -s --data-urlencode "query=${query}" -o avgDurationEmployeesResponse.json

echo "Средняя длительность по сотрудникам"
jq ".data" avgDurationEmployeesResponse.json