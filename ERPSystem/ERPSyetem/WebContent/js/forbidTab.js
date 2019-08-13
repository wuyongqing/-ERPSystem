  //½ûÖ¹¼üÅÌtab¼ü
    document.onkeydown=function(e){
      var isie = (document.all) ? true:false; 
      var key; var ev; if(isie){//IEä¯ÀÀÆ÷  
          key = window.event.keyCode;  
          ev = window.event; 
        }else{//»ğºüä¯ÀÀÆ÷  
            key = e.which;  
            ev = e; 
        }  
        if(key==9){//IEä¯ÀÀÆ÷ 
            if(isie){   
                ev.keyCode=0;   
                ev.returnValue=false;  
            }else{//»ğºüä¯ÀÀÆ÷  
                ev.which=0;   
                ev.preventDefault();  
            } 
        }
    };