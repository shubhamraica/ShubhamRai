import { LightningElement , api } from "lwc";
export default class ChildLwc extends LightningElement {
    @api childVar = 'childVar data';
}