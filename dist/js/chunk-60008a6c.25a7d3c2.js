(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-60008a6c"],{"0a26":function(t,e,i){"use strict";i.d(e,"a",(function(){return r}));var s=i("ad06"),a=i("78eb"),n=i("9884"),o=i("ea8e"),r=function(t){var e=t.parent,i=t.bem,r=t.role;return{mixins:[Object(n["a"])(e),a["a"]],props:{name:null,value:null,disabled:Boolean,iconSize:[Number,String],checkedColor:String,labelPosition:String,labelDisabled:Boolean,shape:{type:String,default:"round"},bindGroup:{type:Boolean,default:!0}},computed:{disableBindRelation:function(){return!this.bindGroup},isDisabled:function(){return this.parent&&this.parent.disabled||this.disabled},direction:function(){return this.parent&&this.parent.direction||null},iconStyle:function(){var t=this.checkedColor||this.parent&&this.parent.checkedColor;if(t&&this.checked&&!this.isDisabled)return{borderColor:t,backgroundColor:t}},tabindex:function(){return this.isDisabled||"radio"===r&&!this.checked?-1:0}},methods:{onClick:function(t){var e=this,i=t.target,s=this.$refs.icon,a=s===i||s.contains(i);this.isDisabled||!a&&this.labelDisabled?this.$emit("click",t):(this.toggle(),setTimeout((function(){e.$emit("click",t)})))},genIcon:function(){var t=this.$createElement,e=this.checked,a=this.iconSize||this.parent&&this.parent.iconSize;return t("div",{ref:"icon",class:i("icon",[this.shape,{disabled:this.isDisabled,checked:e}]),style:{fontSize:Object(o["a"])(a)}},[this.slots("icon",{checked:e})||t(s["a"],{attrs:{name:"success"},style:this.iconStyle})])},genLabel:function(){var t=this.$createElement,e=this.slots();if(e)return t("span",{class:i("label",[this.labelPosition,{disabled:this.isDisabled}])},[e])}},render:function(){var t=arguments[0],e=[this.genIcon()];return"left"===this.labelPosition?e.unshift(this.genLabel()):e.push(this.genLabel()),t("div",{attrs:{role:r,tabindex:this.tabindex,"aria-checked":String(this.checked)},class:i([{disabled:this.isDisabled,"label-disabled":this.labelDisabled},this.direction]),on:{click:this.onClick}},[e])}}}},"1bb9":function(t,e,i){},"1f67":function(t,e,i){},"4ddd":function(t,e,i){"use strict";i("68ef"),i("9d70"),i("3743"),i("dde9")},5899:function(t,e){t.exports="\t\n\v\f\r                　\u2028\u2029\ufeff"},"58a8":function(t,e,i){var s=i("1d80"),a=i("5899"),n="["+a+"]",o=RegExp("^"+n+n+"*"),r=RegExp(n+n+"*$"),c=function(t){return function(e){var i=String(s(e));return 1&t&&(i=i.replace(o,"")),2&t&&(i=i.replace(r,"")),i}};t.exports={start:c(1),end:c(2),trim:c(3)}},6099:function(t,e,i){"use strict";var s=i("1bb9"),a=i.n(s);a.a},7156:function(t,e,i){var s=i("861d"),a=i("d2bb");t.exports=function(t,e,i){var n,o;return a&&"function"==typeof(n=e.constructor)&&n!==i&&s(o=n.prototype)&&o!==i.prototype&&a(t,o),t}},"78eb":function(t,e,i){"use strict";i.d(e,"a",(function(){return s}));var s={inject:{vanField:{default:null}},watch:{value:function(){var t=this.vanField;t&&(t.resetValidation(),t.validateWithTrigger("onChange"))}},created:function(){var t=this.vanField;t&&!t.children&&(t.children=this)}}},9305:function(t,e,i){"use strict";var s=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{},[s("div",{staticClass:"nav-box"},[s("div",{staticClass:"nav-left",on:{click:function(e){return t.toFront()}}},[s("img",{staticStyle:{width:"0.4rem",height:"0.42rem"},attrs:{src:i("e57c"),alt:""}})]),s("span",{staticClass:"nav-title",staticStyle:{opacity:"0.7"}},[t._v(t._s(t.title))]),s("div",{staticClass:"nav-right",on:{click:function(e){return t.toDetail()}}},["地址管理"==t.title?s("span",[t._v("管理")]):t._e()])])])},a=[],n={name:"navHead",props:{title:String},methods:{toFront:function(){console.log("111"),history.go(-1)},toDetail:function(){this.$router.push({path:"/personal/addressDel",query:{}})}}},o=n,r=(i("b905"),i("2877")),c=Object(r["a"])(o,s,a,!1,null,"09744484",null);e["a"]=c.exports},"9f14":function(t,e,i){"use strict";var s=i("d282"),a=i("0a26"),n=Object(s["a"])("radio"),o=n[0],r=n[1];e["a"]=o({mixins:[Object(a["a"])({bem:r,role:"radio",parent:"vanRadio"})],computed:{currentValue:{get:function(){return this.parent?this.parent.value:this.value},set:function(t){(this.parent||this).$emit("input",t)}},checked:function(){return this.currentValue===this.name}},methods:{toggle:function(){this.currentValue=this.name}}})},a44c:function(t,e,i){"use strict";i("68ef"),i("dc1b")},a89a:function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"film-box",staticStyle:{height:"100%"}},[s("div",{staticClass:"content",staticStyle:{"padding-top":"1rem"},style:{minHeight:t.curHeight+"px"}},[s("div",{staticClass:"hedeBox",staticStyle:{position:"fixed",left:"0",top:"0",width:"100%","z-index":"10"}},[s("nav-head",{attrs:{title:t.title}})],1),t._m(0),s("div",{staticClass:"main"},[s("div",{staticClass:"title clear-fix"},[s("div",{staticClass:"left fl"},[t._v("投票上币规则")]),s("div",{staticClass:"right fr",on:{click:function(e){return t.toList()}}},[t._v("我的参与 "),s("img",{staticClass:"img",attrs:{src:i("e7d8"),alt:""}})])]),t._l(t.voteListssss,(function(e,i){return s("div",{key:i,staticClass:"list-item",class:i%2==0?"deep":""},[s("div",{staticClass:"list-nav-box"},[s("div",{staticClass:"list-nav-left"},[t._m(1,!0),s("span",{staticStyle:{"margin-left":"0.27rem",color:"rgba(255,255,255,0.5)"}},[t._v(t._s(e.currency_id)+" "+t._s(e.title))])]),s("span",{staticClass:"right-btn",on:{click:function(i){return t.showVent(e.least,e.maximum,e.status,e.consume_number,e.x_currency_id,e.activity_id)}}},[t._v(" "+t._s(1==e.status?"购买":"已下架")+" ")])]),s("div",{staticClass:"list-price-box1"},[s("div",{staticClass:"list-price-left"},[s("span",{staticClass:"left-text"},[t._v(t._s(e.support)+"票")])]),t._m(2,!0),s("div",{staticStyle:{color:"#E9435A"}},[s("span",{staticClass:"left-text",staticStyle:{color:"#E9435A"}},[t._v(t._s(e.oppose)+"票")])])]),s("div",{staticClass:"list-num-box"},[t._m(3,!0),s("div",{staticClass:"list-num-left"},[s("span",{staticClass:"left-text centent"},[t._v("总票数："+t._s(Number(e.support)+Number(e.oppose)))])]),t._m(4,!0)])])}))],2),t.isShow?s("div",{staticClass:"posiBox",on:{click:function(e){return t.showBox()}}}):t._e(),t.isShow?s("div",{staticClass:"ventanal"},[s("div",{staticClass:"title"},[t._v("立即参与")]),s("div",{staticClass:"isTips"},[s("span",{staticClass:"num"},[t._v("投票数最少: "),s("span",{staticStyle:{color:"#3DD078"}},[t._v(t._s(t.least))])]),s("span",{staticClass:"nums"},[t._v("投票数最多:"),s("span",{staticStyle:{color:"#FA4C45"}},[t._v(t._s(t.maximum))])])]),s("div",{staticClass:"iptBox"},[s("span",{staticClass:"text"},[t._v("证件类型:")]),s("div",{staticClass:"rideoBox",staticStyle:{flex:"1"}},[s("van-radio-group",{attrs:{direction:"horizontal"},model:{value:t.addCoin.is_status,callback:function(e){t.$set(t.addCoin,"is_status",e)},expression:"addCoin.is_status"}},[s("van-radio",{attrs:{name:"1"}},[t._v("支持")]),s("van-radio",{attrs:{name:"2"}},[t._v("反对")])],1)],1)]),s("div",{staticClass:"iptBox"},[s("span",{staticClass:"text"},[t._v("投票数量")]),s("input",{directives:[{name:"model",rawName:"v-model",value:t.addCoin.number,expression:"addCoin.number"}],staticClass:"ipt",attrs:{type:"number",placeholder:"请输入数量"},domProps:{value:t.addCoin.number},on:{input:function(e){e.target.composing||t.$set(t.addCoin,"number",e.target.value)}}})]),s("div",{staticClass:"iptBox"},[s("span",{staticClass:"text"},[t._v("交易密码")]),s("input",{directives:[{name:"model",rawName:"v-model",value:t.addCoin.paypass,expression:"addCoin.paypass"}],staticClass:"ipt",attrs:{type:"password",placeholder:"请输入交易密码"},domProps:{value:t.addCoin.paypass},on:{input:function(e){e.target.composing||t.$set(t.addCoin,"paypass",e.target.value)}}})]),s("div",{staticClass:"tipsText"},[s("p",{staticStyle:{"line-height":"0.6rem"}},[t._v("*每投一票燃烧 "+t._s(t.consume_number)+" "+t._s(t.x_currency_id)+"，从账户自动扣除")]),s("p",[t._v("*投票不可退票")])]),s("div"),s("div",{staticClass:"subBox",on:{click:function(e){return t.userSub()}}},[t._v("提交")])]):t._e()])])},a=[function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"header"},[i("div",{staticClass:"dividing-line"})])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("span",{staticClass:"left-icon"},[s("img",{staticStyle:{width:"100%",height:"100%","border-radius":"100%"},attrs:{src:i("b7b3"),alt:""}})])},function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"process-bar",staticStyle:{"margin-top":"0.2rem",flex:"1"}},[i("div",{staticClass:"process-bar-hover",staticStyle:{width:"21.51%"}})])},function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"list-num-left"},[i("span",{staticClass:"left-text left"},[t._v("支持票数")])])},function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"list-num-left"},[i("span",{staticClass:"left-text right"},[t._v("反对票数")])])}],n=(i("a9e3"),i("e7e5"),i("d399")),o=(i("a44c"),i("e27c")),r=(i("4ddd"),i("9f14")),c=i("2b0e"),l=i("c24f"),d=i("5f87"),u=i("9305");c["a"].use(n["a"]).use(o["a"]).use(r["a"]);var h={components:{NavHead:u["a"]},data:function(){return{url:this.GLOBAL.domainName,parameter:{activity:"vote"},voteListssss:[],addCoin:{u_id:"2",activity:"vote",activity_id:"",is_status:"1",number:"",paypass:""},curHeight:"",isShow:!1,least:"1",maximum:"1000",setTime:"",consume_number:"0.1",x_currency_id:"BTC",voteVal:0,title:"投票上币"}},created:function(){this.addCoin.u_id=sessionStorage.getItem("u_id"),this.voteList(),this.beforeMount()},methods:{showBox:function(){this.isShow=!1},voteList:function(){var t=this,e=Object(d["b"])(this.parameter),i=Object(d["c"])(e);this.parameter.token=i,Object(l["cb"])(this.parameter).then((function(e){console.log(e,t,"投票列表"),0===e.code&&(t.voteListssss=e.data)})).catch((function(e){console.log(e,t)}))},beforeMount:function(t){var e=document.documentElement.clientHeight||document.body.clientHeight;this.curHeight=e,console.log(this.curHeight,"this.curHeight")},showVent:function(t,e,i,s,a,n){var o=this;console.log("点击了"),"1"===i?(o.least=t,o.maximum=e,o.isShow=!0,o.consume_number=s,o.x_currency_id=a,o.addCoin.activity_id=n):o.$toast({message:"活动已下架",duration:1500})},speed:function(t,e){this.voteVal=0;var i=Number(t),s=Number(e),a=i+s;return this.voteVal=0===i?50:i/a*100,this.voteVal},userSub:function(){var t=this,e=this;if(console.log(e.addCoin.is_status,e.addCoin,"that.addCoin.is_status"),""!==e.addCoin.number)if(Number(e.addCoin.least)>=Number(e.addCoin.number)){var i="购买数量不能少于"+parseInt(e.addCoin.least);e.$toast({message:i,duration:1500})}else if(""!==this.addCoin.paypass){var s=Object(d["b"])(this.addCoin),a=Object(d["c"])(s);this.addCoin.token=a,Object(l["i"])(this.addCoin).then((function(i){console.log(i,e,"交易成功"),0===i.code&&(e.$toast({message:"投票成功",duration:1500}),e.isShow=!1,e.voteList(e.parameter),e.addCoin.number="",e.addCoin.paypass="",delete t.addCoin.token)})).catch((function(i){e.$toast({message:i,duration:1500}),e.isShow=!1,e.addCoin.number="",e.addCoin.paypass="",delete t.addCoin.token})),this.isShow=!1}else e.$toast({message:"交易密码不能为空",duration:1500});else e.$toast({message:"投票数量不能为空",duration:1500})},toList:function(){this.$router.push({path:"/vote/list",query:{}})}}},p=h,f=(i("6099"),i("2877")),v=Object(f["a"])(p,s,a,!1,null,"17e60b3c",null);e["default"]=v.exports},a9e3:function(t,e,i){"use strict";var s=i("83ab"),a=i("da84"),n=i("94ca"),o=i("6eeb"),r=i("5135"),c=i("c6b6"),l=i("7156"),d=i("c04e"),u=i("d039"),h=i("7c73"),p=i("241c").f,f=i("06cf").f,v=i("9bf2").f,b=i("58a8").trim,m="Number",g=a[m],C=g.prototype,A=c(h(C))==m,_=function(t){var e,i,s,a,n,o,r,c,l=d(t,!1);if("string"==typeof l&&l.length>2)if(l=b(l),e=l.charCodeAt(0),43===e||45===e){if(i=l.charCodeAt(2),88===i||120===i)return NaN}else if(48===e){switch(l.charCodeAt(1)){case 66:case 98:s=2,a=49;break;case 79:case 111:s=8,a=55;break;default:return+l}for(n=l.slice(2),o=n.length,r=0;r<o;r++)if(c=n.charCodeAt(r),c<48||c>a)return NaN;return parseInt(n,s)}return+l};if(n(m,!g(" 0o1")||!g("0b1")||g("+0x1"))){for(var x,y=function(t){var e=arguments.length<1?0:t,i=this;return i instanceof y&&(A?u((function(){C.valueOf.call(i)})):c(i)!=m)?l(new g(_(e)),i,y):_(e)},S=s?p(g):"MAX_VALUE,MIN_VALUE,NaN,NEGATIVE_INFINITY,POSITIVE_INFINITY,EPSILON,isFinite,isInteger,isNaN,isSafeInteger,MAX_SAFE_INTEGER,MIN_SAFE_INTEGER,parseFloat,parseInt,isInteger".split(","),k=0;S.length>k;k++)r(g,x=S[k])&&!r(y,x)&&v(y,x,f(g,x));y.prototype=C,C.constructor=y,o(a,m,y)}},b7b3:function(t,e,i){t.exports=i.p+"img/user.b98e800d.jpg"},b905:function(t,e,i){"use strict";var s=i("1f67"),a=i.n(s);a.a},dc1b:function(t,e,i){},dde9:function(t,e,i){},e27c:function(t,e,i){"use strict";var s=i("d282"),a=i("78eb"),n=i("9884"),o=Object(s["a"])("radio-group"),r=o[0],c=o[1];e["a"]=r({mixins:[Object(n["b"])("vanRadio"),a["a"]],props:{value:null,disabled:Boolean,direction:String,checkedColor:String,iconSize:[Number,String]},watch:{value:function(t){this.$emit("change",t)}},render:function(){var t=arguments[0];return t("div",{class:c([this.direction]),attrs:{role:"radiogroup"}},[this.slots()])}})},e57c:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAADN0lEQVRYR9WZaW8TMRRF72P7wCZ2se////8AbenClm6CQIECxehEz2C5TiaT2KNiqWrUZjwnd+67fnZM/9mwmrwhhFOSrkn6KWlsZqHm/MxVG/iypOeSfktaM7PxiQUOIVx02DsO+VbSazP7XBO6isIhhEuSnki6J+mMA/6Q9EHSlqSPZobqS4+lgRPY+5JOZ0SHklYkbZjZ0dK0y3o4hIBnUfZuomzk+iVpT9KqpP1aBbiwwq7sM0l4NtoghZ14WNJBLTssnBJeYBH2bPaoefT4loL7UsMG6Ry9FXbYp26DHJbCAnbVzA5qw/ZW2D37OEuDyIWy7yW9bAXbC3iOAtuW9KKFDXpbwgss2iAvMJQdubJVF4mSpTo9HEI4LwnYB4U0wLPY4FXtFW2a/2cCOyxpQM6eyyaJsCsteobewCGEC67sLFjS4FOLNOgF7J6NaVDKWQoMGwwKW0yJJGfTRob30tt+l7TjrWPzAussOrcBylJgubL0Bu+8N6Cp6SzYBlY5+ntTh6WRoevKYbk3kLvsJLwrI96q7yimfEh2MsTn2EIIQFNg0bN5GqQrGSoDyQRDKcz9uNek+wP4iqSHU3qDBk914SkB3gb4uiSy9qYrt/CMjS9kYzsCGL9elfTIofNdQ+RgoeAn2mEoS6Q99mhyU/cx23OK7lZhq8PbJlt3Lz4KbkhgROL++2lK8Bql6RtK0HiIvmHNL27sgGPTU3z/Yi1TGk/fyJTmgq/eoK+bGZ948HHssSanN9iDQizthDclAc3KN+go+jDxNPYoQXPmsOHb929DEk8tnAwae+SNe4QeVOmufpj/kx6xEKnWdERodsgs3c1HZzS50iwu0R45NKBxp8wHaDo6gT09gAQ6FmIOTfEBzYllU+i5gAvQeeTxFpRe90JsZo+5gRPo6Olp0BxPbbbydC/gZHGJni5BY48IXd0evYETaGApRH6XPA30Vm2lFwLOoGcVIieY5DRLepWxMPCc6QEoB9pvTsSBdkd60DuzB4wH2ifjK4MsPWKXx585DsDHu7VO35l0KUukpvQVkUYJaNRE2b2asFWBXWkapNve4O/U/KogilNN4SoRMMckfwBm3y0x1cy3BgAAAABJRU5ErkJggg=="},e7d8:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAYCAYAAAAlBadpAAAA1UlEQVQ4T53UMQrCMBiG4S+FjKKD3kTo3BOIgh1EHDyd4AmSQKdeQ6/Qbl0Mkb9oobRJ/jRjyPOGkBABAMaYE4BD0zT3siwtzXGGqOt61XXdG8DWOfdo2/bKDQjaoaqq3FqrAKxTAj1eGhjwksAIpwYmOCUwi7kBL6aAUirPssx7C0EcC0RxKMDCvgAba633QggDYOOce0opLyw8B4ui+ESxD9JRgjgEgzgGvZgDZzEXTnAKHOFUOOAlsMe/D/AFYPd/OfQAWL8nLdJanwEcpZQ3LiT3BbBKCGr0nA1eAAAAAElFTkSuQmCC"}}]);
//# sourceMappingURL=chunk-60008a6c.25a7d3c2.js.map