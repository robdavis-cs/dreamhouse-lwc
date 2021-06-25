public with sharing class PropertyDetailsController {
    @AuraEnabled
    public static String getBarredDetailName(String detailName) {
        return ContrivedService.addBarToString(detailName);
    }
}