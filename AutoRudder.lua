-- AutoRudder, Created by Useless-Bits.

dofile(lfs.writedir() .. "Scripts/AutoRudderOptions.lua")

local UE_Playerid = LoGetPlayerPlaneId()
local UE_object = LoGetObjectById(UE_Playerid)
local UE_Aircraft = UE_object.Name

if UE_MainPower == true and UE_Aircraft == 'AH-64D_BLK_II' then
    local UE_fmData = LoGetHelicopterFMData()
    local UE_Yaw = UE_fmData.yaw
    local UE_TrueSpeed = LoGetTrueAirSpeed()
    local UE_TSpeed = UE_TrueSpeed * 1.9438
    local UE_TurnSpeedHi = UE_TurnSpeed + 2
    local UE_TurnSpeedLo = UE_TurnSpeed - 2
    local UE_PLeftKey = GetDevice(0)
    local UE_PRightKey = GetDevice(0)
    local UE_CLeftKey = GetDevice(0)
    local UE_CRightKey = GetDevice(0)
    local UE_parkbrake = GetDevice(0)
    local UE_PZeroize = GetDevice(0)
    local UE_CZeroize = GetDevice(0)
    UE_LeftKeyPLT = UE_PLeftKey:get_argument_value(259)
    UE_RightKeyPLT = UE_PRightKey:get_argument_value(260)
    UE_LeftKeyCPG = UE_CLeftKey:get_argument_value(210)
    UE_RightKeyCPG = UE_CRightKey:get_argument_value(212)
    UE_AH64_ParkingBrake = UE_parkbrake:get_argument_value(634)
    UE_PZeroSwitch = UE_PZeroize:get_argument_value(312)
    UE_CZeroSwitch = UE_CZeroize:get_argument_value(360)


    if UE_SpeedEnable == false then
        UE_SetSpeed = UE_SetSpeed + 999
    end

    if UE_PrevYaw then
        local UE_change = UE_Yaw - UE_PrevYaw
        local UE_rudder = UE_change * 1000
        if UE_AH64_ParkingBrake == 1 then
            LoSetCommand(202, 1)
            LoSetCommand(204, 1)
        
        elseif UE_RightKeyPLT == 1 and UE_LeftKeyPLT == 0 or UE_RightKeyCPG == 1 and UE_LeftKeyCPG == 0 then
            if UE_rudder < UE_TurnSpeedHi and UE_rudder > UE_TurnSpeedLo then
                if not UE_CommandsExecuted then
                    LoSetCommand(202, 1)
                    LoSetCommand(204, 1)
                    UE_CommandsExecuted = true
                end
            elseif UE_rudder < UE_TurnSpeed then
                LoSetCommand(203, 1)
                UE_CommandsExecuted = false
            elseif UE_rudder > UE_TurnSpeed then
                LoSetCommand(201, 1)
                UE_CommandsExecuted = false
            end

        elseif UE_LeftKeyPLT == 1 and UE_RightKeyPLT == 0 or UE_LeftKeyCPG == 1 and UE_RightKeyCPG == 0 then
            if UE_rudder > -UE_TurnSpeedHi and UE_rudder < -UE_TurnSpeedLo then
                if not UE_CommandsExecuted then
                    LoSetCommand(202, 1)
                    LoSetCommand(204, 1)
                    UE_CommandsExecuted = true
                end
            elseif UE_rudder < -UE_TurnSpeed then
                LoSetCommand(203, 1)
                UE_ommandsExecuted = false
            elseif UE_rudder > -UE_TurnSpeed then
                LoSetCommand(201, 1)
                UE_CommandsExecuted = false
            end

        elseif UE_PZeroSwitch ~= 0 or UE_CZeroSwitch ~= 0 or UE_TSpeed > UE_SetSpeed then
            LoSetCommand(202, 1)
            LoSetCommand(204, 1)
        elseif UE_rudder < 2 and UE_rudder > -2 then
            if not UE_CommandsExecuted then
                LoSetCommand(202, 1)
                LoSetCommand(204, 1)
                UE_CommandsExecuted = true
            end
        elseif UE_rudder < 0 then
            LoSetCommand(203, 1)
            UE_CommandsExecuted = false
        elseif UE_rudder > 0 then
            LoSetCommand(201, 1)
            UE_CommandsExecuted = false
        end
    end

    UE_PrevYaw = UE_Yaw

elseif UE_MainPower == false then
end
