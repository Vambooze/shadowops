local Translations = {
    error = {
        ["canceled"]                    = "Canceled",
        ["someone_recently_did_this"]   = "Someone recently did this, try again later..",
        ["cannot_do_this_right_now"]    = "Cannot do this right now...",
        ["you_failed"]                  = "You failed!",
        ["you_cannot_do_this"]          = "You cannot do this..",
        ["you_dont_have_enough_money"]  = "You Dont Have Enough Money",
    },
    success = {
        ["case_has_been_unlocked"]              = "Security case has been unlocked",
        ["you_removed_first_security_case"]     = "You removed the the first layer of security on the case",
        ["you_got_paid"]                        = "You got paid",
        ["send_email_right_now"]                 = "I will send you an e-mail right now!",
    },
    info = {
        ["talking_to_boss"]             = "Talking to boss..",
        ["unlocking_case"]              = "Unlocking case..",
        ["checking_quality"]            = "Checking Quality",
    },
    mailstart = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Vehicle Location",
        ["message"]                     = "Updated your gps with the location to a vehicle I got a tip about that contains a briefcase. Retrieve whats inside it and bring it back to me. I've given you a special key that would be used to remove the first layer of security on the case.",
    },
    mail = {
        ["sender"]                      = "Boss",
        ["subject"]                     = "Task Notification",
        ["message1"]                     = "Get the vehicle marked on your gps..",
        ["message2"]                     = "Meet the supplier and get the products.",
        ["message3"]                     = "Wait for a Drop Location",
        ["message4"]                     = "Deliver the goods and vehicle.",
        ["message5"]                     = "Return to the boss for payment.",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
