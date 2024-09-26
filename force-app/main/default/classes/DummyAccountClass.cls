/**
 * @description This class handles the insertion of Account and related Opportunity records.
 * It performs necessary validation, including CRUD and FLS checks, before executing any DML operations.
 */
public with sharing class DummyAccountClass {
    /**
     * @description Inserts a list of Account records and updates their description.
     * Performs CRUD and FLS validation before insertion.
     *
     * @param accList The list of Account records to be inserted.
     * @throws CustomException If the user lacks permission to insert accounts.
     */
    public static void insertAccount(List<Account> accList){
        if(Schema.sObjectType.Account.isCreateable()){
            for(Account acc : accList){
                if(Schema.sObjectType.Account.fields.Description.isUpdateable()){
                    acc.Description = 'Happy';
                    acc.Rating = 'Hot';
                    acc.Industry = 'Agriculture';
                }
            }
            insert accList;
        } else {
            throw new CustomException('You do not have permission to create Account records.');
        }
    }
    /**
     * @description Inserts a list of Account records and updates their description.
     * Performs CRUD and FLS validation before insertion.
     *
     * @param accList The list of Account records to be inserted data.
     * @throws CustomException If the user lacks permission to insert accounts.
     */
    public static void insertNewAccount(List<Account> accList){
        if(Schema.sObjectType.Account.isCreateable()){
            for(Account acc : accList){
                if(Schema.sObjectType.Account.fields.Description.isUpdateable()){
                    acc.Description = 'Happy Welcome';
                }
            }
            insert accList;
        } else {
            throw new CustomException('You do not have permission to create Account records.');
        }
    }
}