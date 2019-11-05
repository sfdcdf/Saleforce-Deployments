/**
 * Created by Francois Poirier on 2019-10-23.
 */

public with sharing class icQueueYbnOutbountTPCaseMaketoSync implements Queueable{

    private String action;
    private String lookupField;
    private String sObjectListJSON;
    private Boolean asyncProcessing;
    private String partitionName;

    public icQueueYbnOutbountTPCaseMaketoSync(String action, String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){

        this.action = action;
        this.lookupField = lookupField;
        this.sObjectListJSON = sObjectListJSON;
        this.asyncProcessing = asyncProcessing;
        this.partitionName = partitionName;

    }


    public void execute(System.QueueableContext context) {

        caseObjectHelper.ybnOutboundCaseUpdateMarketoSchedule(action, lookupField, sObjectListJSON, asyncProcessing, partitionName);

    }
}