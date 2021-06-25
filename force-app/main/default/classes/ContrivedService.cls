@namespaceAccessible
public with sharing class ContrivedService {
    @namespaceAccessible
    public static String addBarToString(String s) {
        return s + 'Bar';
    }
}
