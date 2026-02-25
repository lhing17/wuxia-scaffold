library GameInit initializer OnInit
    function OnInit takes nothing returns nothing
        // 解锁字节码限制
        call DzUnlockOpCodeLimit( true )

        // 以下初始化其他系统
    endfunction
endlibrary