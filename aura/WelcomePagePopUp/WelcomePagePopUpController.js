({
    getPopUp: function(cmp){
    	var toggleText = cmp.find("popUpDivId");
		$A.util.toggleClass(toggleText, "toggle");

        var action = cmp.get("c.getPopUpAd");

        action.setParams({
            "popUpId": cmp.get("v.popUpId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.popUpAd", response.getReturnValue());
                if(response.getReturnValue().Id != undefined){
        			$A.util.toggleClass(toggleText, "toggle");
                }
            }
        });
        $A.enqueueAction(action);
    },
    dismissAd : function(cmp, evt) {
        var popUpId = cmp.get("v.popUpId");
        if(popUpId != ''){
            return false;
        }

        var dismissThisAd = cmp.get("v.popUpAd");
        var action = cmp.get("c.dismissPopUpAd");

        var dismissTextId = cmp.find("dismissTextId");
        $A.util.toggleClass(dismissTextId, "toggle");

		action.setParams({ 
			"dismissedAd": dismissThisAd
		});
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.popUpAd", response.getReturnValue());
                if(response.getReturnValue().Id == undefined){
                	var toggleText = cmp.find("popUpDivId");
        			$A.util.toggleClass(toggleText, "toggle");
                }else{
                    var dismissTextId = cmp.find("dismissTextId");
                    $A.util.toggleClass(dismissTextId, "toggle");
                }
            }
        });
        $A.enqueueAction(action);
   	},
    /*showSpinner : function (component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : true });
        evt.fire();
    },
    hideSpinner : function (component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : false });
        evt.fire();    
    }*/
})