Config = {
  UsingESX = false, --## Set to false if using QBCore
  UsingQBCore = true, --## Set to true if using QBCore
  QBAutoAddItems  = false, --## Set to true if you have exports for adding items. else just leave false. --## Edit the items it adds in QBItems.lua. Saves you having to add them to shared lua yourself. Also makes editing easier.

  --// Notify Cop Chance for illegal Fishing
  NotifyCopChance = 5, --## Chance Cops will be notified of illegal fishing. This Notification will happen at the time the fish gets hooked and the fight begins(Adds RP when they show up mid way through you hauling out a shark)
  Cops = {'police','prangers'}, --## The job names of people you want notified. 

  --// Whale Surprise Settings
  ChanceWhalePullsYouIn        = 75, --## Percent chance you will get to hear my custom whale noises.... e.g Pulled in by a whale.
  TimeToHackUpWhale            = math.random(9,19), --## How many times to chop up the whale?
  ReturnRodFromWhale           = true, --## Will the player find their rod and equiopment in the whales belly?
  ChanceOfCopNotifyWhaleChop   = 75, --## How likely is some runner to call the cops on you for hacking the shit out of a whale on the beach.


  --// Fishing Settings
  ChanceOfEquipmentBreakOnFail = 100, --## Random chance equipment breaks when you fail
  RemoveBaitOnFail = true, --## Remove bait every time a fish gets away? If false will only remove if you catch the fish. Or break equipment.
  MinTimeToCatch   = 25, --## The min time you will wait for a fish to bite in seconds.
  MaxTimeToCatch   = 65, --## The max time you will wait for a fish to bite in seconds.

  CloseInventory = function() --## When using a rod fill this in if your inventory doesn't close

  end,

  FishFinder = { --## Item if used above water will show all the fish available in that depth. 
    Enabled = true, 
    ItemName = "fish-finder", 
    TimeToFind = 10, --## In Seconds how long do they have to search for the fish?
  },

  StoresUseTarget = true, --## If set to true then for qbcore use qb-target and esx use qtarget or set to false to use showhelp

  UsingStores = true, --## Set to false if you want to disable the stores and use your own solution. 

  Stores = {
    ['Little Woods Fishing Store'] = {
      Account = 'bank', --'' Account this will come out of. 
      Loc     = vector4(-1801.81, -1202.9, 14.3, 59.45),
      Ped     = 'a_m_y_bevhills_02',
      Type    = 'Buy',
      Items = {
        rockbottomreel = {
          Label = "Rockbottom Reel",
          Cost  = 50, 
          Desc  = "An average strength reel for catching small fish",
        }, 
        fishfinder = {
          Label = "Fish Finder",
          Cost  = 50, 
          Desc  = "A Fish finder for locating fish in bodies of water",
        },
        linesnifferreel = {
          Label = "LineSniffer Reel",
          Cost  = 50, 
          Desc  = "Line Sniffer Reel used for fishing fishes & sniffing lines.",
        }, 
        fishrusreel = {
          Label = "Fish R Us Reel",
          Cost  = 50, 
          Desc  = "An average strength reel for catching small fish",
        }, 
        thunderreel = {
          Label = "Thunder Reel",
          Cost  = 50, 
          Desc  = "The thunder of reels used for fishing mega fishes.",
        }, 
        zillareel = {
          Label = "Zilla Reel",
          Cost  = 50, 
          Desc  = "The 'zilla' of all reels!",
        }, 
        kingbraid = {
          Label = "KingBraid Line",
          Cost  = 25, 
          Desc  = "The kings braid for catching the most powerful fish in the sea!",
        }, 
         cheapmono = {
          Label = "Cheap Mono Line",
          Cost  = 50, 
          Desc  = "Mine as well use your shoe string..",
        }, 
        bitesizemono = {
          Label = "Rockbottom Reel",
          Cost  = 75, 
          Desc  = "Bite-size Mono Line",
        }, 
        mobeymono = {
          Label = "Mobey Mono Line",
          Cost  = 100, 
          Desc  = "Finally some real fishing line, time to reel em' in!",
        }, 
        noodlebraid  = {
          Label = "noodlebraid",
          Cost  = 125, 
          Desc  = "A professional grade fishing line.",
        }, 
          lightningbraid = {
          Label = "lightningbraid",
          Cost  = 150, 
          Desc  = "The line of lightning ready to catch fish in any waters!.",
        }, 
        no1 = {
          Label = "#1/0 Fish Hook",
          Cost  = 25, 
          Desc  = "Better off using your hands. Good luck!",
        }, 
        no2= {
          Label = "#2/0 Fish Hook",
          Cost  = 25, 
          Desc  = "At least you can catch seaweed with this thing",
        }, 
         no3 = {
          Label = "#3/0 Fish Hook",
          Cost  = 25, 
          Desc  = "Finally a real fishing hook!",
        }, 
        no6 = {
          Label = "#6/0 Fish Hook",
          Cost  = 50, 
          Desc  = "A deep sea fishing hook.",
        }, 
        no10 = {
          Label = "no10",
          Cost  = 75, 
          Desc  = "A professional grade fishing hook!",
        }, 
        towhook = {
          Label = "Tow Hook",
          Cost  = 75, 
          Desc  = "You trying to catch a great white shark with that thing?!",
        },
        valuecastrod = {
          Label = "Value Cast Rod",
          Cost  = 20, 
          Desc  = "Dollar store fishing rod.",
        }, 
        elementalrod = {
          Label = "Elemental Rod",
          Cost  = 50, 
          Desc  = "A rod that can adapt to all elements.",
        }, 
        nerorod = {
          Label = "Nero Rod",
          Cost  = 75, 
          Desc  = "Extremely durable fishing rod.",
        }, 
        brutasrod = {
          Label = "Brutas Rod",
          Cost  = 150, 
          Desc  = "A brute fishing pole.",
        }, 
        zeusrod = {
          Label = "Zeus Rod",
          Cost  = 250, 
          Desc  = "The Zeus of fishing poles!",
        }, 
        magnumxlrod = {
          Label = "Magnum XL Rod",
          Cost  = 50, 
          Desc  = "The best fishing pole on the market the 'magnum'!",
        },
      	nightworms = {
          Label = "Night Worms",
          Cost  = 50, 
          Desc  = "Bait: NightWorms",
        }, 
	      redworms = {
          Label = "Red Worms",
          Cost  = 50, 
          Desc  = "Bait: RedWorms",
        }, 
	      leech = {
          Label = "Leech",
          Cost  = 50, 
          Desc  = "Bait: Leech",
        }, 
	      minnow = {
          Label = "Minnow",
          Cost  = 50, 
          Desc  = "Bait: Minnow",
        }, 

         waxworms = {
          Label = "Waxworms",
          Cost  = 50, 
          Desc  = "Bait: Waxworms",
        },
        mealworms = {
          Label = "Mealworms",
          Cost  = 50, 
          Desc  = "Bait: Mealworms",
        },  
        turtlemeat = {
          Label = "Turtle Meat",
          Cost  = 50, 
          Desc  = "Bait: Turtle Meat",
        }, 
        bread = {
          Label = "Bread",
          Cost  = 50, 
          Desc  = "Bait: Bread",
        }, 
        crab = {
          Label = "Crab",
          Cost  = 50, 
          Desc  = "Bait: Crab",
        }, 
        hugecutbait = {
          Label = "Huge Cut Bait",
          Cost  = 50, 
          Desc  = "Bait: Huge Cut Bait",
        }, 
        maggots = {
          Label = "Maggots",
          Cost  = 50, 
          Desc  = "Bait: Maggots",
        }, 
        technoplankton = {
          Label = "Technoplankton",
          Cost  = 50, 
          Desc  = "Bait: Technoplankton",
        }, 
      },
      Blip = {
        Enabled = true, 
        Sprite  = 317,
        Color   = 15,
        Scale   = 0.6, 
      }, 
    },
    ['Little Woods Fish Monger'] = {
      Account = 'bank', --'' Account this will come out of. 
      Loc     = vector4(-1816.5255126953,-1191.4301757813,14.304763793945,265.38659667969),
      Ped     = 'a_m_y_bevhills_02',
      Type    = 'Sell',
      Items = {
        minnow = {
          Label = "Minnow",
          Cost  = 50, 
          Desc  = "Stank Fash",
        },
        whale = {
          Label = "whale",
          Cost  = 50, 
          Desc  = "whale",
        },
        turtle = {
          Label = "turtle",
          Cost  = 50, 
          Desc  = "turtle",
        },
        dolphin = {
          Label = "dolphin",
          Cost  = 50, 
          Desc  = "dolphin",
        },
        shark = {
          Label = "shark",
          Cost  = 50, 
          Desc  = "shark",
        },
        tuna = {
          Label = "tuna",
          Cost  = 50, 
          Desc  = "tuna",
        },
        haddock = {
          Label = "haddock",
          Cost  = 50, 
          Desc  = "haddock",
        },
        pollock = {
          Label = "pollock",
          Cost  = 50, 
          Desc  = "pollock",
        },
        trout = {
          Label = "trout",
          Cost  = 50, 
          Desc  = "trout",
        },
        stripedbass = {
          Label = "stripedbass",
          Cost  = 50, 
          Desc  = "stripedbass",
        },
        salmon = {
          Label = "salmon",
          Cost  = 50, 
          Desc  = "salmon",
        },
        northernpike = {
          Label = "northernpike",
          Cost  = 50, 
          Desc  = "northernpike",
        },
        garfish = {
          Label = "garfish",
          Cost  = 50, 
          Desc  = "garfish",
        },
        crappie = {
          Label = "crappie",
          Cost  = 50, 
          Desc  = "crappie",
        },
        rainbowtrout = {
          Label = "rainbowtrout",
          Cost  = 50, 
          Desc  = "rainbowtrout",
        },
      }, 
      Blip = {
        Enabled = true, 
        Sprite  = 317,
        Color   = 15,
        Scale   = 0.6, 
      }, 
    },
  },

--FISHING EQUIPMENT
  FishingEquipment = {
    ['rodtype']  = { --## Fishing Equipment Type

      ['magnumxlrod'] = { --## Name in DB of your equipment.
        Label    = "Magnum XL Rod",
        Name     = 'magnumxlrod', --## Must be same as above.
        Strength = 12, --## Adds to overall equipment strength.
      },

      ['zeusrod'] = {
        Label    = "Zeus Rod",
        Name     = 'zeusrod',
        Strength = 9, 
      },
      ['brutasrod'] = {
        Label    = "Brutas Rod",
        Name     = 'brutasrod',
        Strength = 7,
      },
      ['nerorod'] = {
        Label    = "Nero Rod",
        Name     = 'nerorod',
        Strength = 5,
      },
      ['elementalrod'] = {
        Label    = "Elemental Rod",
        Name     = 'elementalrod',
        Strength = 3,
      },
      ['valuecastrod'] = {
        Label    = "Value Cast Rod",
        Name     = 'valuecastrod',
        Strength = 1,
      },
    },
    ['reel'] = {

      ['zillareel'] = { --## Name in DB of your equipment.
        Name     = 'zillareel',  --## Must be same as above.
        Strength = 12, --## Adds to overall equipment strength.
        Speed    = 2.0, --## Percentage Speed at which you will take the fish in when reeling successfully
        DepthLimit = 1000, --## The Depth limit of the reel. You can't lower below this depth.
      },

      ['thunderreel'] = {
        Name     = 'thunderreel',
        Strength = 9,
        Speed    = 1.2,
        DepthLimit = 500,
      },
      ['fishrusreel'] = {
        Name     = 'fishrusreel',
        Strength = 7,
        Speed    = 0.3,
        DepthLimit = 140,
      },
      ['rockbottomreel'] = {
        Name     = 'rockbottomreel',
        Strength = 5,
        Speed    = 1.2,
        DepthLimit = 200,
      },
      ['linesnifferreel'] = {
        Name     = 'linesnifferreel',
        Strength = 3,
        Speed    = 0.6,
        DepthLimit = 90,
      },
      ['brokeassreel'] = {
        Name     = 'brokeassreel',
        Strength = 1,
        Speed    = 0.2,
        DepthLimit = 50,
      },
    },
    ['line'] = {

      ['kingbraid'] = { --## Name in DB of your equipment.
        Name     = 'kingbraid',  --## Must be same as above.
        Strength = 15, --## Adds to overall equipment strength.
      },

      ['lightningbraid'] = {
        Name     = 'lightningbraid',
        Strength = 9, 
      },
      ['noodlebraid'] = {
        Name     = 'noodlebraid',
        Strength = 7, 
      },
      ['mobeymono'] = {
        Name     = 'mobeymono',
        Strength = 5, 
      },
      ['bitesizemono'] = {
        Name     = 'bitesizemono',
        Strength = 3, 
      },
      ['cheapmono'] = {
        Name     = 'cheapmono',
        Strength = 1, 
      },
    },
    ['hook'] = {  

      ['towhook'] = { --## Name in DB of your equipment.
        Name     = 'towhook', --## Must be same as above.
        Strength = 12, --## Adds to overall equipment strength.
      },

      ['no10'] = {
        Name     = 'no10',
        Strength = 9,
      },
      ['no6'] = {
        Name     = 'no6',
        Strength = 7,
      },
      ['no3'] = {
        Name     = 'no3',
        Strength = 5,
      },
      ['no2'] = {
        Name     = 'no2',
        Strength = 3,
      },
      ['no1'] = {
        Name     = 'no1',
        Strength = 1,
      },
    },
    ['bait']  = {

      ['nightworms'] = { --## Name in DB of your equipment.
        Name          = 'nightworms', 
      },

      ['redworms'] = {
        Name          = 'redworms',
      },
      ['mealworms'] = {
        Name          = 'mealworms',
      },
      ['leech'] = {
        Name          = 'leech',
      },
      ['waxworms'] = {
        Name          = 'waxworms',
      },
      ['minnow'] = {
        Name          = 'minnow',
      },
      ['turtlemeat'] = {
        Name          = 'turtlemeat',
      },
      ['tunameat'] = {
        Name          = 'tunameat',
      },
      ['bread'] = {
        Name          = 'bread',
      },
      ['crab'] = {
        Name          = 'crab',
      },
      ['hugecutbait'] = {
        Name          = 'hugecutbait',
      },
      ['bacon'] = {
        Name          = 'bacon',
      },
      ['maggots'] = {
        Name          = 'maggots',
      },
      ['technoplankton'] = {
        Name          = 'technoplankton',
      },      
    },
  },

--FISH TYPES
  FishTypes = {
    ['minnow'] = { --## This is the name of the fish in your DB (Items Table)
      Name = 'Minnow',  --## This is the display name of said fish.
      Strength = 0.5, --## The Overall strength of the fish. This will determine wether you can easily catch it with your rod based off of your overall rod setup strength. Too strong and it could break your equipment.
      Speed = 0.2, --## If the fish is getting away how quickly will it get away.
      ChanceOfFight = 50, --## How likely is the fish to start fighting and adding tension to the line.
      Depth = 0, --## This is the minimum depth at which you will find said fish.
      DepthLimit = 2, --## This is the maximum depth at which you will find said fish.
      BaitTypes = {'maggots','bread'}, --## Types of bait used to catch this fish.
      HookTypes = {'no1'}, --## Types of hooks that you can use to catch this fish.
    },
    ['crab'] = {
      Name = 'Crab',
      Strength = 0.3,
      Speed = 0.7,
      ChanceOfFight = 30,
      Depth = 0,
      DepthLimit = 25,
      BaitTypes = {'technoplankton','bread','tunameat','turtlemeat'},
      HookTypes = {'no1'},
    },
    ['crappie'] = { 
      Name = 'Crappie',
      Strength = 0.3, 
      Speed = 0.2,
      ChanceOfFight = 60,
      Depth = 0,
      DepthLimit = 5,
      BaitTypes = {'maggots','bread','mealworms','redworms'},
      HookTypes = {'no1'},    
    },
    ['garfish'] = {
      Name = 'Gar Fish',
      Strength = 0.5,
      Speed = 0.7,
      ChanceOfFight = math.random(40,60),
      Depth = 10,
      DepthLimit = 50,
      BaitTypes = {'crab','minnow','tunameat'},
      HookTypes = {'no1','no2','no3'},    
    },
    ['rainbowtrout'] = {
      Name = 'Rainbow Trout',
      Strength = 0.2,
      Speed = 0.3,
      ChanceOfFight = 60,
      Depth = 0,
      DepthLimit = 20,
      BaitTypes = {'maggots','waxworms','mealworms'},
      HookTypes = {'no1','no2'},    
    },
    ['northernpike'] = {
      Name = 'Northern Pike',
      Strength = 0.8,
      Speed = 0.6,
      ChanceOfFight = 75,
      Depth = 40,
      DepthLimit = 100,
      BaitTypes = {'minnow','crab','tunameat','nightworms','redworms','leech'},
      HookTypes = {'no3','no6'},  
    },
    ['salmon'] = {
      Name = 'Salmon',
      Strength = 0.4,
      Speed = 0.8,
      ChanceOfFight = 75,
      Depth = 3,
      DepthLimit = 30,
      BaitTypes = {'minnow','redworms','nightworms'},
      HookTypes = {'no6'},     
    },
    ['stripedbass'] = {
      Name = 'Striped Bass',
      Strength = 0.4,
      Speed = 0.6,
      ChanceOfFight = 40,
      Depth = 10,
      DepthLimit = 30,
      BaitTypes = {'bread','leech','tunameat','redworms','nightworms','crab','minnow','maggots','waxworms'},
      HookTypes = {'no2','no3'},   
    },
    ['trout'] = {
      Name = 'Trout',
      Strength = 0.5,
      Speed = 0.3,
      ChanceOfFight = 65,
      Depth = 0,
      DepthLimit = 20,
      BaitTypes = {'maggots','waxworms','mealworms'},
      HookTypes = {'no1','no2','no3'},   
    },
    ['pollock'] = {
      Name = 'Pollock',
      Strength = 0.4,
      Speed = 0.2,
      ChanceOfFight = 30,
      Depth = 20,
      DepthLimit = 120,
      BaitTypes = {'redworms','nightworms','minnow','maggots','waxworms'},
      HookTypes = {'no2','no3'},  
    },
    ['haddock'] = {
      Name = 'Haddock',
      Strength = 0.5,
      Speed = 0.2,
      ChanceOfFight = 40,
      Depth = 40,
      DepthLimit = 120,
      BaitTypes = {'redworms','nightworms','minnow','maggots','waxworms'},
      HookTypes = {'no2','no3'},  
    },
    ['tuna'] = {
      Name = 'Tuna',
      Strength = 1.2,
      Speed = 1.0,
      ChanceOfFight = 60,
      Depth = 200,
      DepthLimit = 400,
      BaitTypes = {'leech','minnow'},
      HookTypes = {'no10'},
    },
    ['shark'] = {
      Name = 'Shark',
      Strength = 1,4,
      Speed = 1.0,
      ChanceOfFight = 75,
      Depth = 200,
      DepthLimit = 600,
      BaitTypes = {'hugecutbait'},
      HookTypes = {'no10'},
    },
    ['dolphin'] = {
      Name = 'Dolphin',
      Strength = 1.2,
      Speed = 1.2,
      ChanceOfFight = 76,
      Depth = 250,
      DepthLimit = 600,
      BaitTypes = {'tunameat','crab'},
      HookTypes = {'no10'}, 
    },
    ['turtle'] = {
      Name = 'Turtle',
      Strength = 1.2,
      Speed = 1.2,
      ChanceOfFight = 30,
      Depth = 250,
      DepthLimit = 350,
      BaitTypes = {'minnow','tunameat'},
      HookTypes = {'no10'},
    },
    ['whale'] = {
      Name = 'Whale',
      Strength = 0.8,
      Speed = 0.8,
      ChanceOfFight = 50,
      Depth = 500,
      DepthLimit = 750,
      BaitTypes = {'technoplankton'},
      HookTypes = {'no10'},
    },  
  },
}

if Config.UsingESX then 
  TriggerEvent("esx:getSharedObject", function(obj) ESX = obj; end)
elseif Config.UsingQBCore then 
  QBCore = exports['qb-core']:GetCoreObject()
end
