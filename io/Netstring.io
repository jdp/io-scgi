// Netstring.io
// Netstring handler for Io's SCGI objects
// Copyright (c) 2008 Justin Poliey <jdp34@njit.edu>

Netstring := Object clone do(

	raw := nil
	
	// Load a raw netstring
	load := method(aSequence,
		raw = aSequence
		return self
	)
	
	// Return the size information
	size := method(
		return raw beforeSeq(":") asNumber
	)
	
	// Return a map of the environment
	items := method(
		env := Map clone
		pieces := raw betweenSeq(":", "\0,") split("\0")
		for (i, 0, pieces size - 1, 2,
			env atPut(pieces at(i), pieces at (i+1))
		)
		return env
	)
	
	// Return the request data
	data := method(
		raw split("\0,") at(1)
	)
    
)
