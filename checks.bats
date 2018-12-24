#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Status' {
  run bash -c "curl http://${SUT_IP}:6300/status"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ '"opened_db_count":0' ]]
}

@test 'Config' {
  run bash -c "curl http://${SUT_IP}:6300/config"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ '"ns.storage_policy":"THREECOPIES"' ]]
}
