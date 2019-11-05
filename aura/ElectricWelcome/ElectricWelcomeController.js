({
    getwelcomePageHtml: function(cmp){
        var action = cmp.get("c.getWelcomePage");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.welcomePageHtml", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})