function receiveNotification(t){var e="_"+t.data.nid+";";-1!==window.notify_config.key.indexOf(e)&&setTimeout(function(){var e=document.createElement("div");e.style.width="320px",e.style.height="75px",e.style.zIndex="999999",e.style.position="fixed",e.style.backgroundColor=t.data.backgroundColor,e.style.borderRadius=t.data.borderRadius+"px",e.setAttribute("placement",t.data.corner),e.className="g-notification g-notification-"+n_idx,e.id="ss-notification-"+t.data.nid;for(var i=document.getElementsByClassName("g-notification"),a=0,n=0;n<i.length;n++){var o=i[n].getAttribute("placement");o==t.data.corner&&a++}var s=100*a+30;switch(t.data.corner){case"1":e.style.bottom=s+"px",e.style.right="30px";break;case"2":e.style.bottom=s+"px",e.style.left="30px";break;case"3":e.style.top=s+"px",e.style.left="30px";break;default:e.style.top=s+"px",e.style.right="30px"}var d=t.data.borderRadius<=7?2:t.data.borderRadius<=10?5:t.data.borderRadius-7;d+="px";var r="left",l="75px",c=site_url+t.data.iconUrl,p="block";0===t.data.isSetIcon&&(r=t.data.messageAlignment,c="",p="none",l="0px");for(var m="<div style='width: 59px; height: 59px; position: absolute; display: "+p+"; top: 8px; left: 8px'><img id='n_icon-"+t.data.nid+"' width='59' height='59' style='border-radius: "+d+"' src='"+c+"' /></div><div style='margin-left: "+l+"; margin-right: 5px; padding-top: 9px; padding-right: 5px; height: 65px'><div class='what' id='notifyMessage-"+t.data.nid+"' style='padding-left: 10px; text-align: "+r+";'>",g=t.data.message.split("\n"),y="",n=0;n<g.length;n++)if(0!==g[n].length){for(var f=!1,u="",h="",x=0;x<g[n].length;x++)"*"===g[n][x]?f?(u+="</b>",h+=u,f=!1,u=""):(f=!0,h+=u,u="<b>"):u+=g[n][x];h+=u,y+="<p class='ss-message-"+t.data.nid+"' style='margin: 0px; font-family: "+t.data.fontFamily+"; font-size: "+t.data.fontSize+"; color: "+t.data.fontColor+"'>"+h+"</p>"}e.innerHTML=m+y+"</div></div>",document.body.appendChild(e),setTimeout(function(){var t=e.className.split(" ");jQuery("."+t[1]).hide("slow",function(){var t=e.getAttribute("placement"),i="0"==t||"3"==t?e.style.top:e.style.bottom,a=1*i.substring(0,i.length-2);e.parentNode.removeChild(e);for(var n=document.getElementsByClassName("g-notification"),o=0;o<n.length;o++){var s=n[o].getAttribute("placement");if(t==s){var d=n[o].className.split(" ")[1];if("0"==s||"3"==s){var r=n[o].style.top,l=1*r.substring(0,r.length-2);if(a>l)continue;jQuery("."+d).animate({top:l-100+"px"},"slow")}else{var c=n[o].style.bottom,p=1*c.substring(0,c.length-2);if(a>p)continue;jQuery("."+d).animate({bottom:p-100+"px"},"slow")}}}})},1e3*t.data.duration),n_idx++},1e3*t.data.time_after)}var n_idx=0,c=document.createElement("iframe");window.syncFrame=c,window.syncFrame=c,c.frameBorder=0,c.style.width="340px",c.style.height="0px",c.style.visibility="hidden",c.style.zIndex="999999",c.style.position="fixed",c.style.top="0px",c.style.right="0px",c.src="https://conversionincrease.herokuapp.com/notifications/show?key="+window.notify_config.key,c.id="iframeWin",document.body.appendChild(c),document.getElementsByTagName("form")[0].onsubmit=function(t){document.getElementById("iframeWin").contentWindow.postMessage(window.notify_config.key,"*")};var site_url="https://conversionincrease.herokuapp.com";window.addEventListener?window.addEventListener("message",receiveNotification,!1):window.attachEvent("onmessage",receiveNotification);