import { LightningElement , api } from "lwc";
export default class ParentLwc extends LightningElement {
    @api parentVar;
    handleClick(){
this.parentVar = 'changed from parent';
    }
}