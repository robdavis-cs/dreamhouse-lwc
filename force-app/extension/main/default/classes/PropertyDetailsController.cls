public with sharing class PropertyDetailsController {
    @AuraEnabled
    public static String getBarredDetailName(Id recordId) {
        Property_Details__c pd = [Select Name From Property_Details__c Where Id = :recordId];
        return ContrivedService.addBarToString(pd.Name);
    }

    @AuraEnabled
    public static Map<String, Object> getProperty(Id recordId){
            Property_Details__c pds = [Select Property__c, Extra_Details__c From Property_Details__c Where Id=:recordId][0];
            Property__c prop = [Select Id, Thumbnail__c, Price__c, City__c, Beds__c, Baths__c, Name from Property__c Where Id=:pds.Property__c][0];
            //Gross hack to avoid namespaced field names and not needing to update base lwc because demo
            Map<String, Object> retVal = new Map<String, Object>{
                'Id' => prop.Id,
                'Name' => prop.Name,
                'Thumbnail__c' => prop.Thumbnail__c,
                'Price__c' => prop.Thumbnail__c,
                'City__c' => prop.City__c,
                'Beds__c' => prop.Beds__c,
                'Baths__c' => prop.Baths__c,
                'extraDetails' => pds.Extra_Details__c
            };
            return retVal;
    }
}