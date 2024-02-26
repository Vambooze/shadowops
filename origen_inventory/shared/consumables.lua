ConsumablesProps = {}
if Config?.UseInvetoryComsumables then
    Config = Config or {}
    Config.ConsumablesEat = {

        ["sandwich"] = math.random(35, 54),
        ["tosti"] = math.random(40, 50),
        ["twerks_candy"] = math.random(35, 54),
        ["snikkel_candy"] = math.random(40, 50),
    }

    Config.ConsumablesDrink = {
        ["water_bottle"] = math.random(35, 54),
        ["kurkakola"] = math.random(35, 54),
        ["coffee"] = math.random(40, 50),
    }

    Config.ConsumablesAlcohol = {
        ["whiskey"] = math.random(20, 30),
        ["beer"] = math.random(30, 40),
        ["vodka"] = math.random(20, 40),
    }
    ConsumablesProps = {
        -- example full configuration
        --[==[
            ['tosti'] = {
            model = 'prop_cs_burger_01', 
            bone = 18905,
            pos = vec3(0.13,0.05,0.02),
            rot = vec3( -50.0,16.0, 60.0),
            animDict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            flags = 49,
            time = 5000,
        },
        ]==]
        ['tosti'] = {
            model = 'prop_cs_burger_01', 
            bone = 18905,
            pos = vec3(0.13,0.05,0.02),
            rot = vec3( -50.0,16.0, 60.0),
        },
        ['water_bottle'] = {
            time = math.random(2000,4000),
            model = 'prop_ld_flow_bottle',
            bone = 18905,
            pos = vec3( 0.12, 0.008, 0.03),
            rot = vec3( 240.0,-60.0, 0)
        },
    }
end
-- weapons items consumables options
ConsumablesProps['pistol_ammo'] = {
        time = 500
    }