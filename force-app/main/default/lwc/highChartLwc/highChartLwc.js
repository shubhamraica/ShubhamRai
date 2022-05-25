import { LightningElement, api, wire  } from "lwc";
import gmailSMTP from "@salesforce/resourceUrl/GmailSMTP";
import HIGHCHARTS from "@salesforce/resourceUrl/Highcharts";
import { loadScript } from "lightning/platformResourceLoader";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import fetchUserDetails from '@salesforce/apex/userDetails.fetchUserDetails';
import fetchObjCount from '@salesforce/apex/userDetails.fetchObjCount';
import updateUser from '@salesforce/apex/userDetails.updateUser';
import removePicture from '@salesforce/apex/userDetails.removePicture';

export default class highChartLWC extends LightningElement {
   highChartInitialized = false;
   @api userObj = {};
   toEditObj = {};   
   @api countObj = [];
   ifShubham;
   isSpinner = false;

  renderedCallback() {
    if (this.highChartInitialized) {
      return;
    }
   loadScript(this, HIGHCHARTS)
     .then(() => {
       console.log("High Charts Loaded");
       this.runHighcharts();
     })
    .catch((error) => console.log("Error occured: ", error));

    loadScript(this, gmailSMTP)
     .then(() => {
       console.log("gmail SMTP Loaded");
       this.handleclick();       
     })
    .catch((error) => console.log("Error occured: ", error));
   }
   

  runHighcharts() {
   const container = this.template.querySelector(".highChartDiv");

   window.Highcharts.chart(container, {
    chart: {
        type: 'bar',
        backgroundColor: {
            linearGradient: [0, 0, 500, 500],
            stops: [
              [0, 'rgb(255, 255, 255)'],
              [1, 'rgb(200, 200, 255)']
            ]
          },
    },
    title: {
        text: 'SObject Details',
    },
    subtitle: {
        text: 'Total number of records against each type of object.'
    },
    xAxis: {
      lineColor: 'black',
      lineWidth: 2,
        categories: ['Account', 'Contact', 'Opportunity', 'Lead', 'Contract', 'Case'],
        title: {  
            text: null
        },
        labels: {
          style: {
              fontSize: '14px',
              color:'black',
          }
      }
    },
    yAxis: {
      lineColor: 'black',
      lineWidth: 2,
        min: 0,
        title: {
            text: null,
            align: 'high'
        },
        labels: {
            overflow: 'justify',
            style: {
              fontSize: '14px',
              color:'black',
          }
        }
    },
    tooltip: {
        valueSuffix: ' records'
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true
            }
        },
        series: {
          borderRadius: 4,
          borderWidth: 1,
          borderColor: '#fff',
          cursor: 'pointer',
          events: {
            click: function (event) {
              window.open("https://cloudanalogy268-dev-ed.lightning.force.com/lightning/o/Account/home");
            }
        }
      }
    },
    credits: {
        enabled: false
    },    
    series: [{
        name: ' ',
        data: this.countObj,
        color: '#282453'
    }]
  });
  }

  connectedCallback(){
    this.ifShubham = !this.ifShubham;
   this.fetchdataFromApex();
  } 
  fetchdataFromApex(){
  fetchUserDetails()
  .then(response=>{
    this.userObj = response;
  })
  .catch(error =>{
    console.log('error::',error);
  })

  fetchObjCount({})
  .then(response=>{
    this.countObj = response;         
  })
  .catch(error =>{
    console.log('error::',error);
  })
}
  handleclick(){
    Email.send({
      Host: "smtp.gmail.com",
      Username : "shubham.rai@cloudanalogy.com",
      Password : "aaaAAA111!!!",
      To : 'yoyogodg@gamil.com',
      From : "shubham.rai@cloudanalogy.com",
      Subject : "<email subject>",
      Body : "<email body>",
      }).then(
        message => alert("mail sent successfully")
      );
    this.ifShubham = !this.ifShubham;
}

changeUserEmail(event){
  this.toEditObj.Email = event.target.value;
}
changeUserName(event){
  this.toEditObj.Username = event.target.value;
}
changeUserCompany(event){
  this.toEditObj.CompanyName = event.target.value;
}
changeUserMobile(event){
  this.toEditObj.MobilePhone = event.target.value;
}
editUser(){
  this.isSpinner = !this.isSpinner;
  console.log(' updated user details :'+JSON.stringify(this.toEditObj));
  updateUser({userDeets :this.toEditObj })
      .then(response=>{
        console.log('done');  
        const evt = new ShowToastEvent({
          title: 'Success !',
          message: 'User has been updated.',
          variant: 'Success',
      });
      this.isSpinner = !this.isSpinner;
      this.dispatchEvent(evt);      
      })
      .catch(error =>{
        console.log('error::',error);
        const evt = new ShowToastEvent({
          title: 'Error !',
          message: 'User updation failed.',
          variant: 'Error',
      });
      this.isSpinner = !this.isSpinner;
      this.dispatchEvent(evt);   
      })
      this.disabled = true;
      this.fetchdataFromApex();
}
disabled = true;
  disableButton() {
    this.disabled = false;
  }
  closeEditUser() {
    this.disabled = true;
  }
  removeDP() {
    this.isSpinner = !this.isSpinner;
    removePicture()
    .then(response=>{
      console.log('done');  
      const evt = new ShowToastEvent({
        title: 'Success !',
        message: 'User\'s profile picture been removed.',
        variant: 'Success',
    });
    this.isSpinner = !this.isSpinner;
    this.dispatchEvent(evt);      
    })
    .catch(error =>{
      console.log('error::',error);
      const evt = new ShowToastEvent({
        title: 'Error !',
        message: 'Some error occured while removing user\' profile picture.',
        variant: 'Error',
    });
    this.isSpinner = !this.isSpinner;
    this.dispatchEvent(evt);   
    })
  }
}