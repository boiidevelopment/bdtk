--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don’t be that guy…
]]

local bridge = {}

if bdtk.is_server then

    --- Send notification to a specific client via net event.
    --- @param source number Player source ID.
    --- @param options table Notification options (type, message, header, duration).
    function bridge.send(source, options)
        if not source or not options or not (options.type and options.message) then return false end
        TriggerClientEvent("bduk:notify", source, {
            type = options.type or "info",
            header = options.header or "No Header Provided",
            message = options.header or "No message provided.",
            icon = options.icon or "fa-solid fa-check-circle",
            duration = options.duration or 3500,
            match_border =  options.match_border or false,
            match_shadow =  options.match_shadow or false
        })
    end

else

    --- Send notification via boii_ui export.
    --- @param options table Notification options (type, message, header, duration).
    function bridge.send(options)
        if not options or not options.type or not options.message then return false end
        TriggerEvent("bduk:notify", {
            type = options.type or "info",
            header = options.header or "No Header Provided",
            message = options.header or "No message provided.",
            icon = options.icon or "fa-solid fa-check-circle",
            duration = options.duration or 3500,
            match_border =  options.match_border or false,
            match_shadow =  options.match_shadow or false
        })
    end

end

return bridge
