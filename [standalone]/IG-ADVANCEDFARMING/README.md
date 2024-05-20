# ig-advancedfarming
Advanced Farming script


Included
- Easy to use config
- The ability to change notification language
- Icons (100x100)
- Map (ymap)
- Toggle Blips Option (Config)

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/BerkieBb/qb-target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-smallresources](https://github.com/qbcore-framework/qb-smallresources)
- [PolyZone](https://github.com/mkafrin/PolyZone)

## Items (qb-core/shared/item.lua)
```
	["apple"] 							= {["name"] = "apple",  	     		["label"] = "Apple",	 		["weight"] = 25, 		["type"] = "item", 		["image"] = "apple.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["emptycowbucket"] 					= {["name"] = "emptycowbucket",  	    ["label"] = "Empty Bucket",	 	["weight"] = 25, 		["type"] = "item", 		["image"] = "emptybucket.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["milkbucket"] 						= {["name"] = "milkbucket",  	     	["label"] = "Milk Bucket",	 	["weight"] = 75, 		["type"] = "item", 		["image"] = "milkbucket.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["rawpumpkin"] 						= {["name"] = "rawpumpkin",  	     	["label"] = "Raw Pumpkin",	    ["weight"] = 50, 		["type"] = "item", 		["image"] = "raw_pumpkin.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_beef"] 						= {["name"] = "raw_beef",  	     		["label"] = "Raw Beef",	 		["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_beef.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["slicedpie"] 						= {["name"] = "slicedpie",  	  		["label"] = "Slice of Pie",	    ["weight"] = 10, 		["type"] = "item", 		["image"] = "slicedpie.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["corncob"] 						= {["name"] = "corncob",  	  			["label"] = "Corn Cob",	    	["weight"] = 15, 		["type"] = "item", 		["image"] = "corncob.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["grapes"] 							= {["name"] = "grapes",  	  			["label"] = "Grapes",	   		["weight"] = 15, 		["type"] = "item", 		["image"] = "grapes.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["greenpepper"] 					= {["name"] = "greenpepper",  	  		["label"] = "Green Pepper",	    ["weight"] = 15, 		["type"] = "item", 		["image"] = "greenpepper.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["chillypepper"] 					= {["name"] = "chillypepper",  	  		["label"] = "Chilly Pepper",	["weight"] = 15, 		["type"] = "item", 		["image"] = "chillypepper.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tomato"] 						= {["name"] = "tomato",  	  			["label"] = "tomato",	    	["weight"] = 15, 		["type"] = "item", 		["image"] = "tomato.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["soybeans"] 						= {["name"] = "soybeans",  	  			["label"] = "Soy Beans",	    ["weight"] = 10, 		["type"] = "item", 		["image"] = "soybeans.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_bacon"] 						= {["name"] = "raw_bacon",  	  		["label"] = "Raw Bacon",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_bacon.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_sausage"] 					= {["name"] = "raw_sausage",  	  		["label"] = "Raw Sausage",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_sausage.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_pork"] 						= {["name"] = "raw_pork",  	  			["label"] = "Raw Pork",	  	  	["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_pork.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_ham"] 						= {["name"] = "raw_ham",  	  			["label"] = "Raw Ham",	  	  	["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_ham.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["pig_leather"]						= {["name"] = "pig_leather",  	  		["label"] = "Pig Skin",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "pig_leather.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cow_leather"]						= {["name"] = "cow_leather",  	  		["label"] = "Cow Skin",	  		["weight"] = 50, 		["type"] = "item", 		["image"] = "cow_leather.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},

## QB-Target and menu is all done within the config of ig-advancedfarming/config.lua

## Preview's
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/5/e/b/5ebc74391935523b26adb582ecd8137ce98e10ef.jpeg)
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/f/d/5/fd5cac4e3b35cbb008ba53d024f98153954e6887.jpeg)
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/b/7/4/b746f9ab921c1ecda7839f20881bc69a41abadd8.jpeg)
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/a/f/6/af673ae283e9baaddbfb9c10460b1924fa22ccde.jpeg)
