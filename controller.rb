#!/usr/bin/env ruby

###################################
# GLOBAL VARIABLES - DEFINE THESE #
###################################
# File locations
$root_dir = "/home/tiwillia/Projects/swagbot"
$ircfile = "#{$root_dir}/swagbot.rb"
$pipe = "#{$root_dir}/swagpipe"

# Server Settings
$server = "irc.devel.redhat.com"
$port = "6667"

# Initial bot settings
$botname = "swagbot"
$channel = "#swaggers"
#################################

class Controller

require 'socket'
require 'thread'

def initialize
	load $ircfile
	new_bot($botname, $channel)
end

def new_bot(nick, channel)
	bot = Swagbot.new($server, $port, nick, channel, $root_dir)
	puts bot.inspect.split
	bot.connect()
	puts "Connected, begining running loop"
	running_loop(bot)
end

def running_loop(bot)
	loop do
		bot.loop()
	end
end

Controller.new()

end
