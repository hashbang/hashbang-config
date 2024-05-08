load test_helper

@test "Cannot login without an ssh key" {
	run ssh_command

	assert_failure
}

@test "can login with an ed25519 ssh key" {
	run ssh_command "ed25519" "jdoe" "debug"
	
	assert_success
	assert_output --partial "ssh-ed25519"
}

@test "can login with an rsa ssh key" {
	run ssh_command "rsa" "jdoe" "debug"
	
	assert_success
	assert_output --partial "ssh-rsa"
}

@test "can login with an ecdsa ssh key" {
	run ssh_command "ecdsa" "jdoe" "debug"
	
	assert_success
	assert_output --partial "ecdsa-sha2-nistp256"
}

@test "Cannot run an invalid command" {
	run ssh_command "ed25519" "jdoe" "invalid"

	assert_failure
	assert_output --partial "Unknown command"
}

@test "Can create user with an ed25519 ssh key" {
	run tmux_command "ssh_command ed25519 user-ed25519"
	run tmux_keys TAB TAB TAB ENTER

	assert_success
}

@test "Can create user with an rsa ssh key" {
	run tmux_command "ssh_command rsa user-rsa"
	run tmux_keys TAB TAB TAB ENTER

	assert_success
}

@test "Can create user with an ecdsa ssh key" {
	run tmux_command "ssh_command ecdsa user-ecdsa"
	run tmux_keys TAB TAB TAB ENTER

	assert_success
}
