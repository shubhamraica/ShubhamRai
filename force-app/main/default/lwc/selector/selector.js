import { LightningElement} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/User.Name';
export default class Selector extends LightningElement {
    get name() {
        return NAME_FIELD;
    }
}