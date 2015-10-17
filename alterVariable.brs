Function alterVariable()
	'Capture HTTP Remote Input
    msg_remote = m.network_input_port.GetMessage() 
    if (type(msg_remote) = "roInputEvent")
        params = msg_remote.getinfo()
        print "Variable: " ; params.variable ; " , Value: " ; params.value
        If params.variable = "" or params.value = ""
        	print "Required field missing data"
        	Return False
        End If

        variable_array = params.variable.Tokenize(".")
        For i = 0 to variable_array.Count()-1
        	If variable_array[i].ToInt() <> 0 or variable_array[i] = "0"
        		variable_array[i] = variable_array[i].ToInt()
        	End If
        End For

        value = params.value
        If (value.ToFloat() <> 0 or value = "0") and value.Instr("|") = -1
            If value.Instr(".") <> -1
                value = value.ToFloat()
            Else
                value = value.ToInt()
            End If
        Else If value.Instr("|") <> -1
            value_array = value.Tokenize("|")
            For i = 0 To value_array.Count()-1
                If value_array[i].ToFloat() <> 0 or value_array[i] = "0"
                    If value_array[i].Instr(".") <> -1
                        value_array[i] = value_array[i].ToFloat()
                    Else
                        value_array[i] = value_array[i].ToInt()
                    End If
                End If
            End For
            value = value_array
        End If

        If variable_array.Count() = 1
        	m[variable_array[0]] = value
        End If
        If variable_array.Count() = 2
        	m[variable_array[0]][variable_array[1]] = value
        End If
        If variable_array.Count() = 3
        	m[variable_array[0]][variable_array[1]][variable_array[2]] = value
        End If
        If variable_array.Count() = 4
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]] = value
        End If
        If variable_array.Count() = 5
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]][variable_array[4]] = value
        End If
        If variable_array.Count() = 6
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]][variable_array[4]][variable_array[5]] = value
        End If
        If variable_array.Count() = 7
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]][variable_array[4]][variable_array[5]][variable_array[6]] = value
        End If
        If variable_array.Count() = 8
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]][variable_array[4]][variable_array[5]][variable_array[6]][variable_array[7]] = value
        End If
        If variable_array.Count() = 9
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]][variable_array[4]][variable_array[5]][variable_array[6]][variable_array[7]][variable_array[8]] = value
        End If
        If variable_array.Count() = 10
        	m[variable_array[0]][variable_array[1]][variable_array[2]][variable_array[3]][variable_array[4]][variable_array[5]][variable_array[6]][variable_array[7]][variable_array[8]][variable_array[9]] = value
        End If

    end if
End Function