https://discord.com/invite/HwddZwJAFy
https://discord.com/invite/HwddZwJAFy
https://discord.com/invite/HwddZwJAFy
https://discord.com/invite/HwddZwJAFy
https://discord.com/invite/HwddZwJAFy


https://www.dirkscripts.com/
https://www.dirkscripts.com/
https://www.dirkscripts.com/
https://www.dirkscripts.com/


Dependencies:

InteractSound:
Used to make my epic whale noises when you inevitably get fucked up by a whale.  Either take the whale.ogg and put it in your own interactsound or just use my version
and start it in your server.cfg

IF YOU ARE USING QBCORE HERE ARE THE ITEMS: (IF NOT USING AUTO ADD)
      https://pastebin.com/sLKYW21n


 --- HOW TO SETUP NEW FISHING EQUIPMENT OR TWEAK STRENGTHS OF OLD FISHING EQUIPMENT
FISHING EQUIPMENT STRENGTHS :

You can set up all sorts of fishing equipment with all different stregnth values. When you setup your rod all the different values will be added towards a total setup strength.
This will determine how easy/hard it is to catch certain fish it will also determine how likely your weakest equipment breaking is.

----------------------------------------------------------------------
Example: 
  Whale: Strength(45), Speed(12)

  Ideal Setup for Whale: 
    magnumxlrod : Strength(12)
    towhook     : Strength(12)
    kingbraid   : Strength(15)
    zillareel   : Strength(12) Speed(12)
    TotalEquipmentStrength(51)

----------------------------------------------------------------------


So in this example the total strength is 51 which is clearly more than the strength of the fish at 45. This means the fish will have a 6 point disadvantage. We work out this difference as a percentage.
Using: https://www.skillsyouneed.com/num/percent-change.html

This percentage is how hard it'll be to fight reel in said fish with your reel. 

The Speed of the reel will be used as a percentage to determine how quickly you will be pulling in the fish when it's not fighting. 

The Speed of the fish will determine how quickly it will pull your rod out when it's fighting against you and you aren't defending successfully.

If you lose the battle there is a random chance your weakest equipment will break if you do not have advantage over the fish(Fish has higher strength than your equipment total strenght).
