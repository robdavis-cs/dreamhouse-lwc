import { LightningElement, api } from 'lwc';
import PROPERTY_FIELD from '@salesforce/schema/Property_Details__c.Property__c';
import getBarredDetailName from '@salesforce/apex/PropertyDetailsController.getBarredDetailName';
import getProperty from '@salesforce/apex/PropertyDetailsController.getProperty';

export default class PropertyDetails extends LightningElement {
    @api recordId;
    barredName = '';
    property;
    propertyLoaded = false;

    connectedCallback() {
        getBarredDetailName({ recordId: this.recordId }).then((res) => {
            this.barredName = res;
        });
        getProperty({ recordId: this.recordId }).then((res) => {
            this.property = res;
            this.propertyLoaded = true;
        });
    }
}
