function obj_alter_variable(object)

	object.onCreate = function(args)
		m.persistent = true
		m.rooms = m.game.Rooms
		m.input = CreateObject("roInput")
		m.input_port = CreateObject("roMessagePort")
		m.input.SetMessagePort(m.input_port)
		m.computer_ip = "192.168.0.245"
		m.timer = CreateObject("roTimespan")
	end function

	object.onUpdate = function(dt)
	    msg = m.input_port.GetMessage() 
	    if (type(msg) = "roInputEvent")
	        params = msg.getinfo()
        	m.alterInstance(params)
		end if

		if m.timer.TotalMilliseconds() > 1000
			m.sendInstances(m.computer_ip)
		end if
	end function

	object.alterInstance = function(params)
        instance = m.game.getInstanceByID(params["id"])
        if instance <> invalid
	        instance.alterVariable = function(code)
		        Eval(code)
		    end function
		    instance.alterVariable(params["code"])
		    print params["code"]
		end if
	end function

	object.sendInstances = function(ip)
		urlTransfer = CreateObject("roUrlTransfer")
		urlTransfer.SetUrl("http://"+ip+":3000/")
		urlTransfer.AddHeader("Content-Type", "application/json")
		instances = {}
		for each key in m.game.Instances
			instances[key] = []
			for each id_key in m.game.Instances[key]
				instances[key].Push(id_key.ToInt())
			end for
		end for
		urlTransfer.PostFromString(FormatJson(instances))
	end function

end function
