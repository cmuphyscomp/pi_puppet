notify { "Beginning puppet update for Raspberry Pi infrastrucure for CMU IDeATe Intro to Physical Computing.": }

include pi_puppet::network
include pi_puppet::scripts
include pi_puppet::misc
include pi_puppet::user
include pi_puppet::ssh
include pi_puppet::packages
