import { LightningElement, api, wire, track } from "lwc";
import fetchRelatedRecords from '@salesforce/apex/RelatedRecordsControlller.fetchRelatedRecords';
import sendMail from '@salesforce/apex/RelatedRecordsControlller.sendMail';
import delRecords from '@salesforce/apex/RelatedRecordsControlller.delRecords';
import searchSOSL from '@salesforce/apex/EmailClass.searchSOSL';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import SystemModstamp from "@salesforce/schema/Account.SystemModstamp";
export default class RelatedRecords extends LightningElement {
    
    @api recordId;                  
    @api objectApiName;

    @api relConList;
    @api relOppList;
    @api relCaseList;
    @api totalCons;
    @api totalOpps;
    @api totalCases;
    @api recordsToDelList = [];   
    @api ifSpinner;   
   @track columns = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'EMail', fieldName: 'Email', type: 'Email' },
    ];

    @wire(fetchRelatedRecords, { apiName: '$objectApiName', recordId: '$recordId' })
    fetchRelatedRecords({ error, data }) {
        if (data) {
            console.log(data)
            this.relConList = data.relatedConList;
            this.relOppList = data.relatedOppList;
            this.relCaseList = data.relatedCaseList;
            this.totalCons = this.relConList.length;
            this.totalOpps = this.relOppList.length;
            this.totalCases = this.relCaseList.length;
        } else if (error) {
            console.log(error);
            this.error = error;
        }
    }


    handleCheck(event) {
        if (event.target.checked) {
            console.log(event.target.value);
            this.recordsToDelList.push(event.target.value);
            console.log('Final recordsToDelList' + this.recordsToDelList);
        } else {
            this.recordsToDelList.pop(event.target.value);
            console.log('Final recordsToDelList' + this.recordsToDelList);
        }
    }

    handleSendMail() {
        if (this.recordsToDelList.length < 1) {
            const evt = new ShowToastEvent({
                title: 'Email Sent Failed',
                message: 'Please select some records to send mail.',
                variant: 'Error',
            });
            this.dispatchEvent(evt);
        } else {
            sendMail({ selectedRecordsIds: this.recordsToDelList })
                .then(result => {
                    const evt = new ShowToastEvent({
                        title: 'Email Sent Successfully',
                        message: 'Email Sent Successfully',
                        variant: 'Success',
                    });
                    this.dispatchEvent(evt);
                })
                .catch(error => {
                    const evt = new ShowToastEvent({
                        title: 'Email Sent Failed',
                        message: 'Email Sent Failed',
                        variant: 'Error',
                    });
                    this.dispatchEvent(evt);
                })
        }
    }

    handleDelete() {
        if (this.recordsToDelList.length < 1) {
            const evt = new ShowToastEvent({
                title: 'Deletion Failed',
                message: 'Please select some records to send delete.',
                variant: 'Error',
            });
            this.dispatchEvent(evt);
        } else {            
        this.ifSpinner = true;
            delRecords({ recordsToDel: this.recordsToDelList })
                .then(result => {                    
                    const evt = new ShowToastEvent({
                        title: 'Record Deleted Successfully',
                        message: 'Record Deleted Successfully',
                        variant: 'Success',
                    });                    
                this.ifSpinner = false;
                    this.dispatchEvent(evt);
                })
                .catch(error => {
                    const evt = new ShowToastEvent({
                        title: 'Record Deletion Failed',
                        message: 'Record Deletion Failed',
                        variant: 'Error',
                    });                    
                    this.ifSpinner = false;
                    this.dispatchEvent(evt);
                })
        }
    }






    @api soslAllObjs = [];
    @api soslAllRecs = [];
    @api totalObjs;
    @api totalRecs;
    
    @wire(searchSOSL, {})
    searchSOSL({ error, data }) {
        if (data) {
            this.soslAllObjs = data.allObjects;
            this.soslAllRecs = data.allRecords;
            this.totalObjs = data.allObjects.length;
            this.totalRecs = data.allRecords.length;
        } else if (error) {
            alert.log(error);
            this.error = error;
        }
    }

    handleTabClick(){
        console.log('okay :'+target.event.value);
    }
}