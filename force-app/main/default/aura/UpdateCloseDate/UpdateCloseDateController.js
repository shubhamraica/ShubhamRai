({
	handleClick : function(c, e, h) {
        try{
            h.helperMethod(c, e, h);
        }catch(e){
            console.log(e);
        }
	}
})