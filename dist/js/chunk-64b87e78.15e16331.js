(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-64b87e78"],{"4eb1":function(t,e,a){},"56bb":function(t,e,a){"use strict";a.r(e);var i=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"film-box",staticStyle:{height:"100%"}},[i("div",{staticClass:"content",staticStyle:{"padding-top":"1.35rem"},style:{minHeight:t.curHeight+"px"}},[i("div",{staticClass:"nav"},[i("div",{staticClass:"navUser clear-fix"},[i("img",{staticClass:"fl img",attrs:{src:a("e57c"),alt:""},on:{click:function(e){return t.toFront()}}}),i("div",{staticClass:"fl"},[i("van-dropdown-menu",[i("van-dropdown-item",{attrs:{options:t.option},on:{change:t.ccc},model:{value:t.value,callback:function(e){t.value=e},expression:"value"}})],1)],1)])]),i("div",{staticClass:"nav-num"},[i("div",{staticClass:"nav-num-left red-font",staticStyle:{"font-size":"0.42rem"}},[t._v(t._s(t.current_price_usd)+" "),i("span",{staticStyle:{"font-size":"0.24rem",color:"#767884"}},[t._v("￥ "+t._s(t.FunHtml(t.current_price_usd)))])]),i("div",{staticClass:"nav-num-right red-font",staticStyle:{"font-size":"0.24rem"}},[t._v(t._s(t.scale)+"%")])]),i("div",{staticClass:"nav-volume"},[i("div",{staticClass:"cjl"},[i("div",{staticClass:"inner-box"},[i("p",{staticStyle:{color:"rgba(255,255,255,0.7)"}},[t._v(t._s(t.textTOfixed(t.onlycoinList[10])))]),i("p",[t._v("24H成交量")])])]),i("div",{staticClass:"zg"},[i("div",{staticClass:"inner-box"},[i("p",{staticStyle:{color:"rgba(255,255,255,0.7)"}},[t._v(t._s(t.textTOfixed(t.onlycoinList[4])))]),i("p",[t._v("最高")])])]),i("div",{staticClass:"zd"},[i("div",{staticClass:"inner-box"},[i("p",{staticStyle:{color:"rgba(255,255,255,0.7)"}},[t._v(t._s(t.textTOfixed(t.onlycoinList[3])))]),i("p",[t._v("最低")])])])]),t._m(0),t._m(1),i("div",{staticClass:"bottom-box"},[t._m(2),i("div",{staticClass:"list-item clear-fix"},[i("div",{staticClass:"fl",staticStyle:{width:"48%"}},t._l(t.depthList.bids,(function(e,a){return i("div",{key:a,staticClass:"clear-fix",staticStyle:{"margin-bottom":"0.05rem"}},[i("div",{staticClass:"box fl",staticStyle:{width:"50%"}},[t._v(t._s(t.FunText(e[0])))]),i("div",{staticClass:"box green-font green-bg fl",staticStyle:{width:"50%"}},[t._v(t._s(t.FunText(e[1])))])])})),0),i("div",{staticClass:"fr",staticStyle:{width:"48%"}},t._l(t.depthList.asks,(function(e,a){return i("div",{key:a,staticClass:"clear-fix",staticStyle:{"margin-bottom":"0.05rem"}},[i("div",{staticClass:"box fl red-font red-bg",staticStyle:{width:"50%"}},[t._v(t._s(t.FunText(e[0])))]),i("div",{staticClass:"box fl",staticStyle:{width:"50%"}},[t._v(t._s(t.FunText(e[1])))])])})),0)])]),i("div",{staticClass:"bnt-box"},[i("div",{staticClass:"bnt-left",on:{click:function(e){return t.userShow(1)}}},[t._v("买入")]),i("div",{staticClass:"bnt-right",on:{click:function(e){return t.userShow(2)}}},[t._v("卖出")])]),t.isShow?i("div",{staticClass:"posiBox",on:{click:function(e){return t.showBox()}}}):t._e(),t.isShow?i("div",{staticClass:"ventanal"},[i("div",{staticClass:"title"},[t._v("立即参与")]),i("div",{staticClass:"isTips",staticStyle:{"margin-bottom":"0.1rem"}},[i("span",{staticClass:"num",staticStyle:{"font-size":"0.3rem"}},[i("span",{staticStyle:{width:"1.2rem",display:"inline-block"}},[t._v("币 种: ")]),i("span",{staticClass:"num1",staticStyle:{color:"#3DD078"}},[t._v(t._s(t.bibisellData.symbol))])])]),i("div",{staticClass:"iptBox"},[i("span",{staticClass:"text"},[t._v("数量")]),i("input",{directives:[{name:"model",rawName:"v-model",value:t.iptNum,expression:"iptNum"}],staticClass:"ipt",attrs:{type:"number",placeholder:"请输入数量"},domProps:{value:t.iptNum},on:{input:[function(e){e.target.composing||(t.iptNum=e.target.value)},t.changeInput]}})]),i("div",{staticClass:"iptBox"},[i("span",{staticClass:"text"},[t._v("交易密码")]),i("input",{directives:[{name:"model",rawName:"v-model",value:t.paypass,expression:"paypass"}],staticClass:"ipt",attrs:{type:"password",placeholder:"请输入交易密码"},domProps:{value:t.paypass},on:{input:function(e){e.target.composing||(t.paypass=e.target.value)}}})]),i("div",{staticClass:"isTips",staticStyle:{"margin-bottom":"0.1rem","margin-top":"0.3rem"}},[i("span",{staticClass:"num",staticStyle:{"font-size":"0.3rem"}},[i("span",{staticStyle:{width:"1.2rem",display:"inline-block"}},[t._v("总额度：")]),i("span",{staticClass:"num1",staticStyle:{color:"#3DD078"}},[t._v(t._s(t.totalAmount))])])]),i("div"),i("div",{staticClass:"subBox",on:{click:function(e){return t.userSub(t.type)}}},[t._v("提交")])]):t._e()])])},s=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"middle-box"},[a("div",{attrs:{id:"chart_example"}})])},function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"bottom-tab"},[a("div",{staticClass:"bottom-tab-left"},[a("span",[t._v("委托订单")]),a("span",[t._v("最新成交")])])])},function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"thead"},[a("div",{staticClass:"thead-left"},[a("span",{staticClass:"green-btn"}),t._v("买盘 "),a("span",{staticClass:"red-btn"}),t._v("卖盘 ")])])}],o=(a("a4d3"),a("e01a"),a("d28b"),a("b0c0"),a("a9e3"),a("b680"),a("d3b7"),a("ac1f"),a("3ca3"),a("1276"),a("ddb0"),a("3835")),n=(a("09d3"),a("2d6d")),l=(a("61ae"),a("d314")),c=(a("e7e5"),a("d399")),r=a("2b0e"),u=a("313e"),d=a.n(u),b=a("c24f"),p=a("5f87");r["a"].use(n["a"]).use(l["a"]).use(c["a"]);var m={components:{},data:function(){return{value:0,option:[],depthList:[],curHeight:"",lineList:[],coinData:{market:"coin",page:1,showpage:10},isShow:!1,current_price_usd:"",iptNum:"",paypass:"",totalAmount:0,resdata24:{},scale:"",depthData:{market:"depth",symbol:"btc"},bibisellData:{u_id:"",symbol:"",price:"",num:"",paypass:""},bibibuyData:{u_id:"10",symbol:"btc",price:"",num:1,paypass:"12345678"},onlycoinData:{market:"onlycoin",symbol:"btc"},onlycoinList:[],type:""}},created:function(){console.log("打印传过来的值",this.$route.query.adUrl),this.bibisellData.u_id=sessionStorage.getItem("u_id"),this.depthFun(),this.coinFun(),this.onlycoinFun(),this.data24()},methods:{textTOfixed:function(t){var e=Number(t),a=e.toFixed(2);return a},onlycoinFun:function(){var t=this,e=Object(p["b"])(this.onlycoinData),a=Object(p["c"])(e);this.onlycoinData.token=a,Object(b["P"])(t.onlycoinData).then((function(e){0===e.code&&(console.log(e,"最高最低"),t.onlycoinList=e.data,console.log(t.onlycoinList[0],e.data),delete t.onlycoinData.token)})).catch((function(e){t.$toast({message:e,duration:1500}),delete t.onlycoinData.token}))},userShow:function(t){this.isShow=!0,this.type=t},bibisellFun:function(){var t=this;t.totalAmount=(Number(t.current_price_usd)*Number(t.iptNum)).toFixed(4),t.bibisellData.price=t.totalAmount,t.bibisellData.num=t.iptNum,t.bibisellData.paypass=t.paypass;var e=Object(p["b"])(this.bibisellData),a=Object(p["c"])(e);this.bibisellData.token=a,Object(b["q"])(t.bibisellData).then((function(e){0===e.code&&(t.$toast({message:"买入成功",duration:1500}),t.iptNum="",t.totalAmount=0,t.paypass="",t.isShow=!1,delete t.bibisellData.token)})).catch((function(e){t.$toast({message:e,duration:1500}),t.isShow=!1,t.iptNum="",t.totalAmount=0,t.paypass="",delete t.bibisellData.token}))},bibibuyFun:function(){var t=this;t.totalAmount=(Number(t.current_price_usd)*Number(t.iptNum)).toFixed(4),t.bibibuyData.price=t.totalAmount,t.bibibuyData.num=t.iptNum,t.bibibuyData.paypass=t.paypass;var e=Object(p["b"])(this.bibibuyData),a=Object(p["c"])(e);t.bibibuyData.token=a,console.log(t.bibibuyData,"bibibuyData"),Object(b["p"])(t.bibibuyData).then((function(e){0===e.code&&(t.$toast({message:"卖出成功",duration:1500}),t.iptNum="",t.totalAmount=0,t.paypass="",t.isShow=!1,delete t.bibibuyData.token)})).catch((function(e){console.log(e,"11"),t.$toast({message:e,duration:1500}),t.iptNum="",t.totalAmount=0,t.paypass="",t.isShow=!1,delete t.bibibuyData.token}))},userSub:function(){var t=this;""!==t.iptNum?""!==t.paypass?1===this.type?this.bibisellFun():2===this.type&&this.bibibuyFun():t.$toast({message:"交易密码不能为空",duration:1500}):t.$toast({message:"数量不能为空",duration:1500})},showBox:function(){this.isShow=!1,this.iptNum="",this.totalAmount=0,this.paypass=""},changeInput:function(){var t=this,e=this;this.$nextTick((function(){console.log(e.iptNum,e.current_price_usd),t.totalAmount=(Number(e.current_price_usd)*Number(e.iptNum)).toFixed(4)}))},beforeMount:function(t){var e=document.documentElement.clientHeight||document.body.clientHeight;this.curHeight=e},depthFun:function(){var t=this,e=this,a=Object(p["b"])(this.depthData),i=Object(p["c"])(a);this.depthData.token=i,Object(b["x"])(this.depthData).then((function(a){0===a.code&&(t.depthList=a.data,delete e.depthData.token)})).catch((function(t){console.log(t),delete e.depthData.token}))},FunText:function(t){var e=Number(t),a=e.toFixed(4);return a},FunHtml:function(t){var e=Number(t),a=(7*e).toFixed(4);return a},coinFun:function(){var t=this,e=this,a=Object(p["b"])(this.coinData),i=Object(p["c"])(a);this.coinData.token=i,Object(b["t"])(this.coinData).then((function(a){console.log("币种列表",a),e.list=a.data;var i=!0,s=!1,n=void 0;try{for(var l,c=a.data.entries()[Symbol.iterator]();!(i=(l=c.next()).done);i=!0){var r=Object(o["a"])(l.value,2),u=r[0],d=r[1],b={text:"",value:0,current_price_usd:"",scale:""};"USDT/USDT"===d.name||(b.text=d.name,b.value=u,b.current_price_usd=d.current_price_usd,b.scale=d.scale,e.option.push(b))}}catch(m){s=!0,n=m}finally{try{i||null==c.return||c.return()}finally{if(s)throw n}}t.scale=t.option[0].scale;var p=t.option[0].text.split("/");e.bibisellData.symbol=p[0].toLowerCase(),e.bibibuyData.symbol=p[0].toLowerCase(),e.onlycoinData.symbol=p[0].toLowerCase(),t.current_price_usd=t.option[0].current_price_usd,delete e.coinData.token})).catch((function(t){e.$toast({message:t,duration:1500}),delete e.coinData.token}))},toFront:function(){history.go(-1)},ccc:function(t){console.log("type",t);var e=this,a=!0,i=!1,s=void 0;try{for(var n,l=e.option.entries()[Symbol.iterator]();!(a=(n=l.next()).done);a=!0){var c=Object(o["a"])(n.value,2),r=c[0],u=c[1];if(u.value===t){console.log("等于了",r,u,u),e.scale=u.scale,e.current_price_usd=u.current_price_usd;var d=u.text.split("/");e.bibisellData.symbol=d[0].toLowerCase(),e.bibibuyData.symbol=d[0].toLowerCase(),e.onlycoinData.symbol=d[0].toLowerCase(),e.depthFun(),e.onlycoinFun()}}}catch(b){i=!0,s=b}finally{try{a||null==l.return||l.return()}finally{if(i)throw s}}},data24:function(){var t=this;t.resdata24.market="data",t.resdata24.symbol="btc",t.resdata24.period="1440",t.resdata24.size=100;var e=Object(p["b"])(this.resdata24),a=Object(p["c"])(e);t.resdata24.token=a,Object(b["H"])(t.resdata24).then((function(e){0===e.code&&(console.log(e.data,"24data"),t.lineList=e.data,t.lineData())})).catch((function(e){t.$toast({message:e,duration:1500}),delete t.onlycoinData.token}))},generateOHLC:function(t){var e=[];if(e=this.lineList,0!==e.length)return console.log("他是不是空"),e;console.log("他是空");var a=+new Date(2011,0,1),i=600;console.log(i,"minuteminuteminute");var s=12e3*Math.random(),o=new Array(4),n=12;console.log();for(var l=0;l<t;l++){console.log(a,"xValuexValuexValue"),s=s+20*Math.random()-10;for(var c=0;c<4;c++)o[c]=(Math.random()-.5)*n+s;o.sort(),console.log(o,"boxValsboxValsboxValsboxValsboxValsboxValsboxValsboxValsboxValsboxValsboxVals");var r=Math.round(3*Math.random());console.log(r,"123456");var u=Math.round(2*Math.random());u===r&&u++;var b=o[3]*(1e3+500*Math.random());e[l]=[d.a.format.formatTime("yyyy-MM-dd\nhh:mm:ss",a+=i),+o[r].toFixed(2),+o[3].toFixed(2),+o[0].toFixed(2),+o[u].toFixed(2),b.toFixed(0),p(l,+o[r],+o[u],4)]}return console.log(e,"data数据源来着"),e;function p(t,e,a,i){var s;return console.log(t,e,a,i),e>a?s=-1:e<a&&(s=1),console.log(s,"signsignsignsignsign"),s}},lineData:function(){var t=d.a.init(document.getElementById("chart_example")),e="#ec0000",a="#8A0000",i="#00da3c",s="#008F28",o=10;console.log(o,"dataCount");var n=this.generateOHLC(o),l={backgroundColor:"#1b213b",dataset:{source:n},grid:[{left:"7%",top:"5%",right:"10%",bottom:100},{left:"10%",right:"10%",height:40,bottom:0}],xAxis:[{type:"category",scale:!0,boundaryGap:!1,axisLine:{onZero:!1,lineStyle:{color:"rgba(255,255,255,0.5)",with:1}},border:"red",axisLabel:{show:!0,textStyle:{color:"rgba(255,255,255,0.3)",fontSize:10}},splitNumber:20,min:"dataMin",max:"dataMax"},{type:"category",gridIndex:1,scale:!0,boundaryGap:!1,axisLine:{onZero:!1},axisTick:{show:!1},splitLine:{show:!1},axisLabel:{show:!1},splitNumber:20,min:"dataMin",max:"dataMax"}],yAxis:[{position:"right",axisLine:{lineStyle:{color:"rgba(255,255,255,0.5)",with:1}},scale:!0,splitLine:{show:!0},axisLabel:{show:!0,textStyle:{color:"rgba(255,255,255,0.3)"}},splitArea:{show:!0,areaStyle:{color:["rgba(0,0,0,0)","rgba(0,0,0,0)"]}}},{scale:!0,gridIndex:1,splitNumber:2,axisLabel:{show:!1},axisLine:{show:!1},axisTick:{show:!1},splitLine:{show:!1}}],dataZoom:[{type:"inside",xAxisIndex:[0,1],start:10,end:100}],visualMap:{show:!1,seriesIndex:1,dimension:6,pieces:[{value:1,color:e},{value:-1,color:i}]},series:[{type:"candlestick",itemStyle:{color:e,color0:i,borderColor:a,borderColor0:s},encode:{x:0,y:[1,4,3,2]}},{name:"Volumn",type:"bar",xAxisIndex:1,yAxisIndex:1,itemStyle:{color:"#7fbe9e"},large:!0,encode:{x:0,y:5}}]};t.setOption(l),window.addEventListener("resize",(function(){t.resize()}))}},mounted:function(){}},h=m,y=(a("9d84"),a("2877")),v=Object(y["a"])(h,i,s,!1,null,"0bf1b681",null);e["default"]=v.exports},"9d84":function(t,e,a){"use strict";var i=a("4eb1"),s=a.n(i);s.a},b0c0:function(t,e,a){var i=a("83ab"),s=a("9bf2").f,o=Function.prototype,n=o.toString,l=/^\s*function ([^ (]*)/,c="name";i&&!(c in o)&&s(o,c,{configurable:!0,get:function(){try{return n.call(this).match(l)[1]}catch(t){return""}}})},e57c:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAADN0lEQVRYR9WZaW8TMRRF72P7wCZ2se////8AbenClm6CQIECxehEz2C5TiaT2KNiqWrUZjwnd+67fnZM/9mwmrwhhFOSrkn6KWlsZqHm/MxVG/iypOeSfktaM7PxiQUOIVx02DsO+VbSazP7XBO6isIhhEuSnki6J+mMA/6Q9EHSlqSPZobqS4+lgRPY+5JOZ0SHklYkbZjZ0dK0y3o4hIBnUfZuomzk+iVpT9KqpP1aBbiwwq7sM0l4NtoghZ14WNJBLTssnBJeYBH2bPaoefT4loL7UsMG6Ry9FXbYp26DHJbCAnbVzA5qw/ZW2D37OEuDyIWy7yW9bAXbC3iOAtuW9KKFDXpbwgss2iAvMJQdubJVF4mSpTo9HEI4LwnYB4U0wLPY4FXtFW2a/2cCOyxpQM6eyyaJsCsteobewCGEC67sLFjS4FOLNOgF7J6NaVDKWQoMGwwKW0yJJGfTRob30tt+l7TjrWPzAussOrcBylJgubL0Bu+8N6Cp6SzYBlY5+ntTh6WRoevKYbk3kLvsJLwrI96q7yimfEh2MsTn2EIIQFNg0bN5GqQrGSoDyQRDKcz9uNek+wP4iqSHU3qDBk914SkB3gb4uiSy9qYrt/CMjS9kYzsCGL9elfTIofNdQ+RgoeAn2mEoS6Q99mhyU/cx23OK7lZhq8PbJlt3Lz4KbkhgROL++2lK8Bql6RtK0HiIvmHNL27sgGPTU3z/Yi1TGk/fyJTmgq/eoK+bGZ948HHssSanN9iDQizthDclAc3KN+go+jDxNPYoQXPmsOHb929DEk8tnAwae+SNe4QeVOmufpj/kx6xEKnWdERodsgs3c1HZzS50iwu0R45NKBxp8wHaDo6gT09gAQ6FmIOTfEBzYllU+i5gAvQeeTxFpRe90JsZo+5gRPo6Olp0BxPbbbydC/gZHGJni5BY48IXd0evYETaGApRH6XPA30Vm2lFwLOoGcVIieY5DRLepWxMPCc6QEoB9pvTsSBdkd60DuzB4wH2ifjK4MsPWKXx585DsDHu7VO35l0KUukpvQVkUYJaNRE2b2asFWBXWkapNve4O/U/KogilNN4SoRMMckfwBm3y0x1cy3BgAAAABJRU5ErkJggg=="}}]);
//# sourceMappingURL=chunk-64b87e78.15e16331.js.map