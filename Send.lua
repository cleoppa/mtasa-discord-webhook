WebhookList = {};
WebhookClass = setmetatable({
        constructor = function(self, args)
            
        end;

        send = function(self, message)
            local sendOptions = {
                content = message:gsub("#%x%x%x%x%x%x", ""),
			    username = self.username,
                avatar = self.avatar
			};
            fetchRemote(self.link, sendOptions,
		        function(responseData)
		        
                end;
	        );
        end;
    }, {
    __call = function(cls, ...)
        local self = {}
        setmetatable(self, {
            __index = cls
        })

        self:constructor(...)

        return self
    end;
});

addEventHandler("onResourceStart", resourceRoot,
    function()
        for name, data in pairs(Webhooks) do
            WebhookList[name] = WebhookClass(name);
        end;
    end;
);

function sendMessage(channel, message)
    if WebhookList[channel] then
        WebhookList[channel]:send(message);
    else
        outputDebugString("DiscordWebhook: Couldn't find the Discord Webhook Channel.");
    end;
end;