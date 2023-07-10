-- AutoRudder, Created by Useless-Bits.

do
	local PrevLuaExportAfterNextFrame=LuaExportAfterNextFrame;
	LuaExportAfterNextFrame=function()
		dofile(lfs.writedir() .. "Scripts/AutoRudder.lua")
		if PrevLuaExportAfterNextFrame then
			PrevLuaExportAfterNextFrame();
		end
	end
end
