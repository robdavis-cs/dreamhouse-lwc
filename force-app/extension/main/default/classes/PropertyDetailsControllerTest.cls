@isTest
public class PropertyDetailsControllerTest {
    @isTest
    public static void PropertyDetailsControllerTest() {
        Property__c pack = new Property__c(Name = 'Test Property');
        insert pack;
        Property_Details__c propertyDetail = new Property_Details__c(Name = 'Test Property Detail');
        insert propertyDetail;
        Test.startTest();
        String barredName = PropertyDetailsController.getBarredDetailName(propertyDetail.Id);
        Test.stopTest();
        System.assertEquals(propertyDetail.Name + 'Bar', barredName, 'that name was not correctly barred');
    }
}