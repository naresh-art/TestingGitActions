trigger PullRequestTrigger on Pull_Request__c (after insert, after update) {
    if (Trigger.isAfter) {
        PullRequestCaseLinker.handleAfter(Trigger.new, Trigger.oldMap, Trigger.isInsert, Trigger.isUpdate);
    }
}