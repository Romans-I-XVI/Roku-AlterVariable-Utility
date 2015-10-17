Function alterVariable()
	'Capture HTTP Remote Input
    msg_remote = m.network_input_port.GetMessage() 
    if (type(msg_remote) = "roInputEvent")
        params = msg_remote.getinfo()
        For Each key in params
            code = params[key]
            If code <> ""
                Eval(code)
                print code
            End If
        End For
    end if
End Function