/**
 * Created by Administrator on 2020/5/11.
 */
var ajax_http = function (method,url,data,callback,type = 'text'){
    let http;
    if(window.XMLHttpRequest){
        http = new XMLHttpRequest();
    } else {
        http = new ActiveXObject( 'Microsoft.XMLHTTP' );
    }

    if( method.toLowerCase() == 'post'){
        http.open("POST",url, true);
        http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        http.send(jsonToString(data));
    }else{
        http.open("GET",url+"?"+jsonToString(data), true);
        http.send(null);
    }

    http.onreadystatechange = function(){
        if(http.readyState == 4 && http.status == 200){
            if(type == 'text'){
                callback(http.responseText);
            }else if(type == 'json'){
                callback(JSON.parse(http.responseText));
            }else{
                callback(JSON.parse(http.responseXML));
            }
        }
    }
}

var ajax_file = function (url,data,callback,type = 'text'){
    let http;
    if(window.XMLHttpRequest){
        http = new XMLHttpRequest();
    } else {
        http = new ActiveXObject( 'Microsoft.XMLHTTP' );
    }
    http.open("POST",url, true);
    http.send(data);
    http.onreadystatechange = function(){
        if(http.readyState == 4 && http.status == 200){
            if(type == 'text'){
                callback(http.responseText);
            }else if(type == 'json'){
                callback(JSON.parse(http.responseText));
            }else{
                callback(JSON.parse(http.responseXML));
            }
        }
    }
}


function jsonToString(json) {
    var arr = [];
    for (var i in json) {
        arr.push(i + '=' + json[i]);
    };
    return arr.join('&');
}