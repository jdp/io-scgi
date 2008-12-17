# Example SCGI Application

# Clone your own handler
my_handler := SCGIHandler clone do(
	# The respond function responds to requests
	respond = method(aSocket, env,
		aSocket streamWrite("Content-type: text/html\n\n")
		aSocket streamWrite("<h1>Hello from SCGI!</h1>\n")
		aSocket streamWrite("<h2>Environment</h2>\n")
		aSocket streamWrite("<pre>")
		env foreach(k, v, aSocket streamWrite(k .. "=" .. v .. "\n"))
		aSocket streamWrite("</pre>")
	)
)

# Clone a server and assign your handler
server := SCGIServer clone do (
	handler = my_handler
)

# Fire it up
server setPort(4000) start

