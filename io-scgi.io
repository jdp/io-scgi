#!/usr/bin/env io

File
Socket
Server

SCGIServer := Server clone do(
        setPort(4000)
        handler := SCGIHandler
        handleSocket := method(aSocket,
                handler clone @handle(aSocket)
        )
)

"-- Starting up an SCGIServer..." println
SCGIServer start
