(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-d3215dae"],{3878:function(t,i,s){"use strict";var e=s("c972"),a=s.n(e);a.a},"788b":function(t,i,s){"use strict";s.r(i);var e=function(){var t=this,i=t.$createElement,s=t._self._c||i;return s("div",{staticClass:"film-box",staticStyle:{height:"100%"}},[s("div",{staticClass:"content",style:{minHeight:t.curHeight+"px"}},[s("div",{staticClass:"nav-box"},[s("div",{staticClass:"nav-title"},[s("span",{staticClass:"title-aa",class:1==t.titleActive?"active":"",on:{click:t.clickTtile1}},[t._v("币币")]),s("span",{staticClass:"title-aa",class:2==t.titleActive?"active":"",on:{click:t.clickTtile2}},[t._v("合约")])])]),s("div",{staticClass:"nav2-box"},[s("div",{staticClass:"item",on:{click:function(i){return t.userNav(0)}}},[s("span",{class:0==t.isNav?"active":""},[t._v("自 选")])]),s("div",{staticClass:"item",on:{click:function(i){return t.userNav(1)}}},[s("span",{class:1==t.isNav?"active":""},[t._v("BNB")])]),s("div",{staticClass:"item",on:{click:function(i){return t.userNav(2)}}},[s("span",{class:2==t.isNav?"active":""},[t._v("BTC")])]),s("div",{staticClass:"item",on:{click:function(i){return t.userNav(3)}}},[s("span",{class:3==t.isNav?"active":""},[t._v("ALTS")])]),s("div",{staticClass:"item",on:{click:function(i){return t.userNav(4)}}},[s("span",{class:4==t.isNav?"active":""},[t._v("FIAT")])])]),t._m(0),t._l(t.list,(function(i,e){return s("div",{key:e},[s("div",{staticClass:"list-box",class:e%2==0?"odd":"even",on:{click:function(i){return t.toDetails()}}},[s("div",{staticClass:"list-item1",staticStyle:{width:"3rem"}},[s("div",{staticClass:"container"},[s("p",{staticStyle:{color:"white","margin-bottom":"0.17rem"}},[s("span",{staticStyle:{color:"#fff",opacity:"0.5"}},[t._v(t._s(i.name)+" ")])]),s("p",{staticStyle:{"font-size":"0.24rem"}},[t._v("24H量 "+t._s(i.market_value))])])]),s("div",{staticClass:"list-item"},[s("div",{staticClass:"container"},[i.scale<0?s("p",{staticClass:"red-font",staticStyle:{"margin-bottom":"0.17rem"}},[t._v(t._s(i.current_price_usd))]):s("p",{staticClass:"red-font red-font1",staticStyle:{"margin-bottom":"0.17rem"}},[t._v(t._s(i.current_price_usd))]),s("p",{staticStyle:{"font-size":"0.24rem"}},[t._v("￥"+t._s(7*i.market_value))])])]),i.scale>0?s("div",{staticClass:"list-item"},[s("div",{staticClass:"right-btn"},[t._v("+"+t._s(i.scale)+"%")])]):s("div",{staticClass:"list-item"},[s("div",{staticClass:"right-btn1"},[t._v(t._s(i.scale)+"%")])])])])}))],2)])},a=[function(){var t=this,i=t.$createElement,s=t._self._c||i;return s("div",{staticClass:"thead"},[s("div",[t._v("交易对 / 成交量 ")]),s("div",[t._v("最新价格")]),s("div",[t._v("24H涨跌")])])}],c=s("c24f"),n=s("5f87"),l={components:{},data:function(){return{titleActive:1,curHeight:"",parameter:{market:"coin",page:1,showpage:50},list:[],isNav:0}},created:function(){this.beforeMount();var t=Object(n["b"])(this.parameter),i=Object(n["c"])(t);this.parameter.token=i,this.marketList(this.parameter)},methods:{beforeMount:function(t){var i=document.documentElement.clientHeight||document.body.clientHeight;this.curHeight=i},clickTtile1:function(){this.titleActive=1},clickTtile2:function(){this.titleActive=2},toDetails:function(){this.$router.push({path:"/market/marketDetails",query:{}})},userNav:function(t){this.isNav=t},marketList:function(t){var i=this;Object(c["t"])(t).then((function(t){console.log("res市场",t),i.list=t.data})).catch((function(t){return console.log(t)}))}},mounted:function(){}},r=l,o=(s("3878"),s("2877")),v=Object(o["a"])(r,e,a,!1,null,"de49ce62",null);i["default"]=v.exports},c972:function(t,i,s){}}]);
//# sourceMappingURL=chunk-d3215dae.a53d21b7.js.map