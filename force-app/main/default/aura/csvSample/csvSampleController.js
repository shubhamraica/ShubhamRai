({  
    loadAccountList: function(component, event, helper){
       helper.onLoad(component, event);
    },
     
    downloadCsv : function(component,event,helper){
        var stockData = component.get("v.ListOfAccount");
        
        var csv = helper.convertArrayOfObjectsToCSV(component,stockData);   
         if (csv == null){return;} 
        
        // ####--code for create a temp. <a> html tag [link tag] for download the CSV file--####     
	     var hiddenElement = document.createElement('a');
          hiddenElement.href = 'data:text/csv;charset=utf-8,%EF%BB%BF' + encodeURI(csv);
          hiddenElement.target = '_self'; // 
          hiddenElement.download = 'ListOfAccount.csv'; 
          document.body.appendChild(hiddenElement); 
    	  hiddenElement.click();
        }, 
 })