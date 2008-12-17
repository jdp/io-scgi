# SCGIServer.io
# A simple SCGI server for Io
# Copyright (c) 2008 Justin Poliey <jdp34@njit.edu>

SCGIServer := Server clone do(

	# Just won't work without it?
	init := method()
	
	# Default port is 4000
	setPort(4000)
	
	# The class that will handle incoming requests
	handler := SCGIHandler
	
	# Delegate requests to coroutines
	handleSocket := method(aSocket,
		handler clone @handle(aSocket)
	)
	
)

# Start a bare-bones SCGI server
if (isLaunchScript,
	write("--Skeleton SCGIServer server started\n")
	SCGIServer start
)
