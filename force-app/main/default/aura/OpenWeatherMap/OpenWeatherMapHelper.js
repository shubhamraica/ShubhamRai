({
    HandleClickHelper : function(component,event,helper) {
        var city = component.get("v.city");
        var action = component.get("c.getWeather");
        action.setParams({
            "city" : city
        }); 
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=JSON.parse(data.getReturnValue());
                var temperature = (response.Temperature - 273.15).toFixed(0);
                var temperature_min = (response.Temperature_min - 273.15).toFixed(0);
                var temperature_max = (response.Temperature_max - 273.15).toFixed(0);
                var description = response.Description;
                var icon = response.icon;
                component.set("v.temperature_min",temperature_min);
                component.set("v.temperature_max",temperature_max);
                component.set("v.temperature",temperature);
                component.set("v.description",description);
                component.set("v.icon",icon);
                component.set("v.imgSrc","http://openweathermap.org/img/w/"+icon+".png");
                
                if(description == 'haze'){
                    document.getElementById("Report").style.backgroundImage = "url('https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/10/23/746497-smog.jpg')";
                }
                 if(description == 'dust'){
                    document.getElementById("Report").style.backgroundImage = "url('https://images.hindustantimes.com/img/2021/04/16/1600x900/imd_1618616767272_1618616774417.jpg')";
                }
                if(description == 'few clouds' || description == 'broken clouds' || description == 'scattered clouds'){
                    document.getElementById("Report").style.backgroundImage = "url('https://img.freepik.com/free-vector/cloudy-blue-background_53876-82143.jpg?size=338&ext=jpg')";
                }
                if(description == 'overcast clouds'){
                    document.getElementById("Report").style.backgroundImage = "url('https://media.istockphoto.com/vectors/blue-sky-and-clouds-seamless-vector-background-vector-id1163292935?k=6&m=1163292935&s=612x612&w=0&h=LdBO37h9Eo7ad9Ftv9SMk_sB-OApxebsZUnWXJyak2U=')";
                }
                if(description == 'clear sky' || description == 'clear sky'){
                    document.getElementById("Report").style.backgroundImage = "url('https://i.pinimg.com/originals/7e/0b/c2/7e0bc25ef59dd338f74c0cad54dad503.png')";
                }
                if(description == 'snow'){
                    document.getElementById("Report").style.background = "linear-gradient(to bottom, #2980b9, #6dd5fa, #ffffff)";
                }
                if(description == 'rain' || description == 'shower rain' || description == 'light rain'){
                    document.getElementById("Report").style.backgroundImage = "url('https://images4.alphacoders.com/279/thumb-350-279306.jpg')";
                }
                if(description == 'mist'){
                    document.getElementById("Report").style.background = "linear-gradient(to bottom, #2980b9, #6dd5fa, #ffffff)";
                }
                setInterval(function() {
                    var today = $A.localizationService.formatDate(new Date(), "MMM-DD-YYYY");
                    component.set('v.today', today);
                    var today2 = new Date();
                    var hours = today2.getHours();
                    var minutes = today2.getMinutes();
                    var seconds = today2.getSeconds();
                    seconds = '0'+seconds;
                    var ampm = hours >= 12 ? 'PM' : 'AM';
                    hours = hours % 12;
                    hours = hours ? hours : 12;
                    minutes = minutes < 10 ? '0'+minutes : minutes;
                    var todayTime = hours + ':' + minutes + ':' +('0' + seconds).slice(-2)+' '+ ampm;                
                    component.set('v.todayTime', todayTime); 
                }, 1000);
            }
            else{
                aert('error');
            }
        });
        $A.enqueueAction(action);  
    }
})