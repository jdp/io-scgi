# Example SCGI Application

# Clone your own handler
my_handler := SCGIHandler clone do(
	# The respond function responds to requests
	respond = method(aSocket, env,
		aSocket streamWrite("Content-type: text/html\n\n")
		aSocket streamWrite("<h1>Hello from SCGI</h1>\n")
	)
)

# Clone a server and assign your handler
server := SCGIServer clone
server handler = my_handler

# Fire it up
server start

