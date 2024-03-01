-- Change your language here.
Labels = {
  MainControls = "Press ~INPUT_THROW_GRENADE~ to try and cast your line.\nPress ~INPUT_SPECIAL_ABILITY_SECONDARY~ to modfiy your rod.\nPress ~INPUT_CREATOR_DELETE~ to cancel.",
  FishingControls = "~INPUT_MOVE_UP_ONLY~ Reel in\n~INPUT_MOVE_DOWN_ONLY~ Reel out", 
  NoFishBiting = "No fish biting. Rethink your rod setup/depth?",
  FishCaught = "You have caught a %s",
  BaitLost = "Your bait has come off you will have to rebait!",
  LineBroke = "You broke your line. Please set your rod back up.",
  TakenRodOut = "You have taken out your ",
  NoRodInVehicle = "You can't take your rod out in the car.",
  AlreadyHoldingRod = "You are already holding a ",
  NotHere = "You can't do that here",
  DepthInfo ="There are %s(s) at a minimum depth of %s and a maximum of %s",
  SetRodProperly = "You are going to need to set up your rod properly before you cast.",
  FaceWater = 'You need to be facing water in order to cast your line.',
  FishFromVehicle = "You cant fish from a vehicle.",
  FishAndSwim = 'You cant swim and fish.',
}

-- Change your notification types here.
Fishing.ShowNotification = function(msg, t)
  if Config.UsingESX then 
    ESX.ShowNotification(msg)
  elseif Config.UsingQBCore then 
    QBCore.Functions.Notify(msg, "success", (t or 2500))
  else
    AddTextEntry('fishing_notification', msg)
    SetNotificationTextEntry('fishing_notification')
    DrawNotification(false, true)
  end
end

-- Edit standard help notification here.
Fishing.ShowHelpNotification = function(msg)
  AddTextEntry('fishing_help_notification', msg)
  DisplayHelpTextThisFrame('fishing_help_notification', false)
end

Fishing.NotifyCops = function()
  for _,Cops in pairs(Config.Cops) do 
    --## Add your own cop notification event here. If you do not know what you are doing ask for commmunity help in the discord. 
  end
end