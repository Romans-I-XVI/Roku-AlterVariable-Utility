function obj_debugger(object)

    object.onCreate = function(args)
        m.persistent = true
        m.pauseable = false
    end function

    object.onECPInput = function(data as object)
        if data.DoesExist("type") and data.type = "debugger_code" and data.DoesExist("code")
            Eval(data.code)
        end if
    end function

    object.onButton = function(code as Integer)
        if code = 10
            m.DrawColliders(not m.game.debugging.draw_colliders)
        end if
    
        ' -------Button Code Reference--------
        ' Pressed | Released | Held
    
        ' Back  0  100 1000
        ' Up  2  102 1002
        ' Down  3  103 1003
        ' Left  4  104 1004
        ' Right  5  105 1005
        ' Select  6  106 1006
        ' Instant Replay  7  107 1007
        ' Rewind  8  108 1008
        ' Fast  Forward  9  109 1009
        ' Info  10  110 1010
        ' Play  13  113 1013
    end function

    object.DrawColliders = function(enabled as boolean) as void
        m.game.debugDrawColliders(enabled)
    end function

    object.DrawSafeZones = function(enabled as boolean) as void
        m.game.debugDrawSafeZones(enabled)
    end function

    object.LimitFrameRate = function(rate as integer) as void
        m.game.debugLimitFrameRate(rate)
    end function

end function
