// SCGIHandler.io
// A simple SCGI handler for Io
// Copyright (c) 2008 Justin Poliey <jdp34@njit.edu>

SCGIHandler := Object clone do(

	// Don't override this unless you're sure
	handle := method(aSocket,
		aSocket streamReadNextChunk
		netstring := Netstring clone load(aSocket readBuffer)
		respond(aSocket, netstring items)
		aSocket close
	)
	
	// Respond to an SCGI request, where the magic happens
	// Override this in your application
	respond := method(aSocket, env,
		aSocket streamWrite("Content-type: text/html\n\n")
		aSocket streamWrite("<h1>You're running on SCGI!</h1>")
		aSocket streamWrite("<pre>")
		env foreach(k, v, aSocket streamWrite(k .. "=" .. v .. "\n"))
		aSocket streamWrite("</pre>")
	)
	
)
