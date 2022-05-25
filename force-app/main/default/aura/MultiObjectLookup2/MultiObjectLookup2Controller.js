({
    // To prepopulate the seleted value pill if value attribute is filled
	doInit : function( component, event, helper ) {
        console.log(component.get("v.sObjectName"));
    	$A.util.toggleClass(component.find('resultsDiv'), 'slds-is-open');
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');

		var objectList = component.get('v.objectList');
		objectList.push( {label:'campaign', APIName:'campaign', fieldName: 'name', iconName: 'standard:campaign'} );
		objectList.push( {label:'Opportunity', APIName:'opportunity', fieldName: 'name', iconName: 'standard:opportunity'} );
        objectList.push( {label:'Cases', APIName:'case', fieldName: 'name', iconName: 'standard:case'} );
		objectList.push( {label:'Contract', APIName:'contract', fieldName: 'name', iconName: 'standard:contract'} );
		component.set('v.objectList', objectList);
        component.set('v.selectedObject', component.get('v.objectList')[0]);
	},

	showObjects : function( component, event, helper ) {
        component.set('v.showObjectList', true);
		$A.util.toggleClass(component.find('objectDataDiv'), 'slds-is-open');
	},
    openModal : function( component, event, helper ) {
        component.set('v.openModallll', true);
    },
    selectObject : function( component, event, helper ) {
        component.set('v.showObjectList', false);
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var objectList = component.get('v.objectList');
            var index = objectList.findIndex(x => x.APIName === event.currentTarget.id)
            if(index != -1)
                var selectedObject = objectList[index];
            component.set('v.selectedObject', selectedObject);
            component.set('v.searchString', '');
        }
    },

    // When a keyword is entered in search box
	searchRecords : function( component, event, helper ) {
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        if( !$A.util.isEmpty(component.get('v.searchString')) ) {
		    helper.searchRecordsHelper(component, event, helper);
        } else {
            $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
        }
	},

    // When an item is selected
	selectItem : function( component, event, helper ) {
        if(!$A.util.isEmpty(event.currentTarget.id)) {
    		var recordsList = component.get('v.recordsList');
    		var index = recordsList.findIndex(x => x.value === event.currentTarget.id)
            if(index != -1)
                var selectedRecord = recordsList[index];
            component.set('v.selectedRecord', selectedRecord);
            component.set('v.value', selectedRecord.value);
            $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
        }
	},

    // To remove the selected item.
	removeItem : function( component, event, helper ){
        component.set('v.selectedRecord','');
        component.set('v.value','');
        component.set('v.searchString','');
        setTimeout( function() {
            component.find( 'inputLookup' ).focus();
        }, 250);
    },

    // To close the dropdown if clicked outside the dropdown.
    blurRecordList : function( component, event, helper ){
    	$A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
    },

    blurObjectList : function( component, event, helper ){
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        component.set('v.showObjectList', false);
    },
    handleOnSubmit : function( component, event, helper ){
        var params = event.getParams();  
        alert(params.id);  
        component.set('v.openModallll', false);
    },
    onCancel : function( component, event, helper ){        
        component.set('v.openModallll', false);
    },
    handleSuccess : function(component, event, helper){
        component.set('v.openModallll', false);
        console.log('event.getParamasrfgsdfvsdfgvsdfserf("id")');
        console.log(event.getParam("id"));
        component.set('v.afterSaveForId', true);
        component.set('v.aftersaveId', event.getParam("id"));
    }
})
/*
 Code by CafeForce
 Website: http://www.cafeforce.com
 DO NOT REMOVE THIS HEADER/FOOTER FOR FREE CODE USAGE
*/