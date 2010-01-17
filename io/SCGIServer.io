// SCGIServer.io
// A simple SCGI server for Io
// Copyright (c) 2008 Justin Poliey <jdp34@njit.edu>

SCGIServer := Server clone do(
	
	// The class that will handle incoming requests
	handler := SCGIHandler
	
	// Delegate requests to coroutines
	handleSocket := method(aSocket,
		handler clone @handle(aSocket)
	)
	
)

// Start a bare-bones SCGI server
if (isLaunchScript,
	write("--Skeleton SCGIServer server started\n")
	SCGIServer setPort(4000) start
)
