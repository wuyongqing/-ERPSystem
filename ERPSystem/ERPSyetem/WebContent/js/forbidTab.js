  //��ֹ����tab��
    document.onkeydown=function(e){
      var isie = (document.all) ? true:false; 
      var key; var ev; if(isie){//IE�����  
          key = window.event.keyCode;  
          ev = window.event; 
        }else{//��������  
            key = e.which;  
            ev = e; 
        }  
        if(key==9){//IE����� 
            if(isie){   
                ev.keyCode=0;   
                ev.returnValue=false;  
            }else{//��������  
                ev.which=0;   
                ev.preventDefault();  
            } 
        }
    };