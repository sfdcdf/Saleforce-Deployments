public class DeleteNoneAccountMarketoActivityBatch implements Database.Batchable<sObject> {

    String query;

    public DeleteNoneAccountMarketoActivityBatch() {
        query = Label.DeleteNoneAccountMarketoActivityBatchQuery;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }

     public void execute(Database.BatchableContext BC, List<sObject> scope) {
        delete scope; 
    }

    public void finish(Database.BatchableContext BC) {

    }

}