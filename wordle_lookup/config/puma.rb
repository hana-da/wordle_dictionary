# frozen_string_literal: true

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch('PORT', 3000)

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch('PIDFILE', 'tmp/server.pid')

# Allow puma to be restarted by `touch tmp/restart.txt` command.
plugin :tmp_restart
