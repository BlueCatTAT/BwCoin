(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-f60b8f7e"],{1146:function(t,e,i){},1325:function(t,e,i){"use strict";i.d(e,"b",(function(){return r})),i.d(e,"a",(function(){return o})),i.d(e,"c",(function(){return c}));var n=i("a142"),s=!1;if(!n["f"])try{var a={};Object.defineProperty(a,"passive",{get:function(){s=!0}}),window.addEventListener("test-passive",null,a)}catch(u){}function r(t,e,i,a){void 0===a&&(a=!1),n["f"]||t.addEventListener(e,i,!!s&&{capture:!1,passive:a})}function o(t,e,i){n["f"]||t.removeEventListener(e,i)}function l(t){t.stopPropagation()}function c(t,e){("boolean"!==typeof t.cancelable||t.cancelable)&&t.preventDefault(),e&&l(t)}},"1f67":function(t,e,i){},"2c38":function(t,e,i){"use strict";i.r(e);var n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"film-box",staticStyle:{height:"100%"}},[i("div",{staticClass:"content",style:{minHeight:t.curHeight+"px"}},[i("div",{staticClass:"hedeBox",staticStyle:{position:"fixed",left:"0",top:"0",width:"100%","z-index":"10"}},[i("nav-head",{attrs:{title:"zh"==this.$store.state.language?"公告通知":"Announcement notice"}})],1),i("div",{staticClass:"fixed-box"},[i("div",{staticClass:"search"},["en"==this.$store.state.language?i("van-search",{attrs:{shape:"round",background:"#1B213B",placeholder:"请输入标题"},model:{value:t.value,callback:function(e){t.value=e},expression:"value"}}):i("van-search",{attrs:{shape:"round",background:"#1B213B",placeholder:"Please enter a title"},model:{value:t.value,callback:function(e){t.value=e},expression:"value"}})],1),i("div",{staticClass:"gg-tab"},[i("span",{class:0==t.spanActive?"gg-tab-active":"",on:{click:function(e){return t.butSpan(0)}}},[t._v(t._s(t.$t("common.hangyezixun")))]),i("span",{class:1==t.spanActive?"gg-tab-active":"",on:{click:function(e){return t.butSpan(1)}}},[t._v(t._s(t.$t("common.caijinzixun")))]),i("span",{class:2==t.spanActive?"gg-tab-active":"",on:{click:function(e){return t.butSpan(2)}}},[t._v(t._s(t.$t("common.guojizixun")))]),i("span",{class:3==t.spanActive?"gg-tab-active":"",on:{click:function(e){return t.butSpan(3)}}},[t._v(t._s(t.$t("common.xitongzixun")))])]),i("div",{staticClass:"dividing-line"})]),i("div",{staticClass:"zhanwei"}),t._l(t.newlists,(function(e,n){return i("div",{key:n,staticClass:"list-item",on:{click:function(i){return t.toDetails(e.id)}}},[i("p",{staticClass:"title"},[t._v(t._s(e.title))]),i("div",{staticClass:"ckxq"},[i("span",{staticClass:"time-box",staticStyle:{"text-align":"left"}},[t._v(t._s(t.format(e.create_time)))]),i("span",{staticStyle:{"margin-left":"2.5rem","margin-right":"0.17rem"}},[t._v("查看详情")]),i("van-icon",{staticStyle:{"vertical-align":"middle"},attrs:{name:"arrow"}})],1)])}))],2)])},s=[],a=(i("a4d3"),i("e01a"),i("d28b"),i("d3b7"),i("3ca3"),i("ddb0"),i("3835")),r=(i("c3a6"),i("ad06")),o=(i("5852"),i("d961")),l=i("2b0e"),c=i("c24f"),u=i("5f87"),h=i("9305");l["a"].use(r["a"]).use(o["a"]);var d={components:{NavHead:h["a"]},data:function(){return{title:"公告通知",value:"",newlistData:{type:"news"},newlists:[],list0:[],list1:[],list2:[],list3:[],curHeight:"",spanActive:0}},created:function(){this.nesListFun(),this.beforeMount()},methods:{add0:function(t){return t<10?"0"+t:t},format:function(t){var e=1e3*t,i=new Date(e),n=i.getFullYear(),s=i.getMonth()+1,a=i.getDate(),r=i.getHours(),o=i.getMinutes(),l=i.getSeconds();return console.log(n+"-"+this.add0(s)+"-"+this.add0(a)+" "+this.add0(r)+":"+this.add0(o)+":"+this.add0(l)),n+"-"+this.add0(s)+"-"+this.add0(a)+"  "+this.add0(r)+":"+this.add0(o)+":"+this.add0(l)},beforeMount:function(t){var e=document.documentElement.clientHeight||document.body.clientHeight;this.curHeight=e,console.log(this.curHeight,"this.curHeight")},nesListFun:function(){var t=this,e=this,i=Object(u["b"])(this.newlistData),n=Object(u["c"])(i);this.newlistData.token=n,Object(c["N"])(this.newlistData).then((function(t){if(console.log(t,e,"新闻列表"),0===t.code){var i=!0,n=!1,s=void 0;try{for(var r,o=t.data.entries()[Symbol.iterator]();!(i=(r=o.next()).done);i=!0){var l=Object(a["a"])(r.value,2),c=l[0],u=l[1];"行业资讯"===u.type?(console.log(c),e.list0.push(u)):"财经资讯"===u.type?e.list1.push(u):"国际资讯"===u.type?e.list2.push(u):"系统资讯"===u.type&&e.list3.push(u)}}catch(h){n=!0,s=h}finally{try{i||null==o.return||o.return()}finally{if(n)throw s}}e.newlists=e.list0,console.log(e.newlists,"00"),console.log(e.list0,"0"),console.log(e.list1,"2"),console.log(e.list2,"2"),console.log(e.list3,"3")}})).catch((function(i){console.log(i,e),delete t.newlistData.token}))},toDetails:function(t){this.$router.push({path:"/notice/detail",query:{news_id:t}})},butSpan:function(t){var e=this;0===t?e.newlists=e.list0:1===t?e.newlists=e.list1:2===t?e.newlists=e.list2:3===t&&(e.newlists=e.list3),e.spanActive=t}}},f=d,g=(i("f766"),i("2877")),v=Object(g["a"])(f,n,s,!1,null,"b6ad5826",null);e["default"]=v.exports},"482d":function(t,e,i){"use strict";function n(t,e,i){return Math.min(Math.max(t,e),i)}function s(t,e,i){var n=t.indexOf(e);return-1===n?t:"-"===e&&0!==n?t.slice(0,n):t.slice(0,n+1)+t.slice(n).replace(i,"")}function a(t,e){t=e?s(t,".",/\./g):t.split(".")[0],t=s(t,"-",/-/g);var i=e?/[^-0-9.]/g:/[^-0-9]/g;return t.replace(i,"")}i.d(e,"b",(function(){return n})),i.d(e,"a",(function(){return a}))},"565f":function(t,e,i){"use strict";var n=i("2638"),s=i.n(n),a=i("c31d"),r=i("1325"),o=i("482d"),l=i("a142");function c(){return!l["f"]&&/ios|iphone|ipad|ipod/.test(navigator.userAgent.toLowerCase())}var u=i("a8c1"),h=c();function d(){h&&Object(u["g"])(Object(u["b"])())}var f=i("d282"),g=i("ea8e"),v=i("ad06"),p=i("7744"),b=i("dfaf"),m=Object(f["a"])("field"),y=m[0],w=m[1];e["a"]=y({inheritAttrs:!1,provide:function(){return{vanField:this}},inject:{vanForm:{default:null}},props:Object(a["a"])(Object(a["a"])({},b["a"]),{},{name:String,rules:Array,disabled:Boolean,readonly:Boolean,autosize:[Boolean,Object],leftIcon:String,rightIcon:String,clearable:Boolean,formatter:Function,maxlength:[Number,String],labelWidth:[Number,String],labelClass:null,labelAlign:String,inputAlign:String,placeholder:String,errorMessage:String,errorMessageAlign:String,showWordLimit:Boolean,type:{type:String,default:"text"},error:{type:Boolean,default:null},colon:{type:Boolean,default:null}}),data:function(){return{focused:!1,validateMessage:""}},watch:{value:function(){this.resetValidation(),this.validateWithTrigger("onChange"),this.$nextTick(this.adjustSize)}},mounted:function(){this.format(),this.$nextTick(this.adjustSize),this.vanForm&&this.vanForm.addField(this)},beforeDestroy:function(){this.vanForm&&this.vanForm.removeField(this)},computed:{showClear:function(){return this.clearable&&this.focused&&""!==this.value&&Object(l["b"])(this.value)&&!this.readonly},showError:function(){return null!==this.error?this.error:!!(this.vanForm&&this.vanForm.showError&&this.validateMessage)||void 0},listeners:function(){return Object(a["a"])(Object(a["a"])({},this.$listeners),{},{blur:this.onBlur,focus:this.onFocus,input:this.onInput,click:this.onClickInput,keypress:this.onKeypress})},labelStyle:function(){var t=this.getProp("labelWidth");if(t)return{width:Object(g["a"])(t)}},formValue:function(){return this.children&&(this.$scopedSlots.input||this.$slots.input)?this.children.value:this.value}},methods:{focus:function(){this.$refs.input&&this.$refs.input.focus()},blur:function(){this.$refs.input&&this.$refs.input.blur()},runValidator:function(t,e){return new Promise((function(i){var n=e.validator(t,e);if(Object(l["e"])(n))return n.then(i);i(n)}))},isEmptyValue:function(t){return Array.isArray(t)?!t.length:!t},runSyncRule:function(t,e){return(!e.required||!this.isEmptyValue(t))&&!(e.pattern&&!e.pattern.test(t))},getRuleMessage:function(t,e){var i=e.message;return Object(l["c"])(i)?i(t,e):i},runRules:function(t){var e=this;return t.reduce((function(t,i){return t.then((function(){if(!e.validateMessage){var t=e.formValue;if(i.formatter&&(t=i.formatter(t,i)),e.runSyncRule(t,i))return i.validator?e.runValidator(t,i).then((function(n){!1===n&&(e.validateMessage=e.getRuleMessage(t,i))})):void 0;e.validateMessage=e.getRuleMessage(t,i)}}))}),Promise.resolve())},validate:function(t){var e=this;return void 0===t&&(t=this.rules),new Promise((function(i){t||i(),e.runRules(t).then((function(){e.validateMessage?i({name:e.name,message:e.validateMessage}):i()}))}))},validateWithTrigger:function(t){if(this.vanForm&&this.rules){var e=this.vanForm.validateTrigger===t,i=this.rules.filter((function(i){return i.trigger?i.trigger===t:e}));this.validate(i)}},resetValidation:function(){this.validateMessage&&(this.validateMessage="")},format:function(t){if(void 0===t&&(t=this.$refs.input),t){var e=t,i=e.value,n=this.maxlength;if(Object(l["b"])(n)&&i.length>n&&(i=i.slice(0,n),t.value=i),"number"===this.type||"digit"===this.type){var s=i,a="number"===this.type;i=Object(o["a"])(i,a),i!==s&&(t.value=i)}if(this.formatter){var r=i;i=this.formatter(i),i!==r&&(t.value=i)}return i}},onInput:function(t){t.target.composing||this.$emit("input",this.format(t.target))},onFocus:function(t){this.focused=!0,this.$emit("focus",t),this.readonly&&this.blur()},onBlur:function(t){this.focused=!1,this.$emit("blur",t),this.validateWithTrigger("onBlur"),d()},onClick:function(t){this.$emit("click",t)},onClickInput:function(t){this.$emit("click-input",t)},onClickLeftIcon:function(t){this.$emit("click-left-icon",t)},onClickRightIcon:function(t){this.$emit("click-right-icon",t)},onClear:function(t){Object(r["c"])(t),this.$emit("input",""),this.$emit("clear",t)},onKeypress:function(t){var e=13;if(t.keyCode===e){var i=this.getProp("submitOnEnter");i||"textarea"===this.type||Object(r["c"])(t),"search"===this.type&&this.blur()}this.$emit("keypress",t)},adjustSize:function(){var t=this.$refs.input;if("textarea"===this.type&&this.autosize&&t){t.style.height="auto";var e=t.scrollHeight;if(Object(l["d"])(this.autosize)){var i=this.autosize,n=i.maxHeight,s=i.minHeight;n&&(e=Math.min(e,n)),s&&(e=Math.max(e,s))}e&&(t.style.height=e+"px")}},genInput:function(){var t=this.$createElement,e=this.type,i=this.slots("input"),n=this.getProp("inputAlign");if(i)return t("div",{class:w("control",[n,"custom"]),on:{click:this.onClickInput}},[i]);var r={ref:"input",class:w("control",n),domProps:{value:this.value},attrs:Object(a["a"])(Object(a["a"])({},this.$attrs),{},{name:this.name,disabled:this.disabled,readonly:this.readonly,placeholder:this.placeholder}),on:this.listeners,directives:[{name:"model",value:this.value}]};if("textarea"===e)return t("textarea",s()([{},r]));var o,l=e;return"number"===e&&(l="text",o="decimal"),"digit"===e&&(l="tel",o="numeric"),t("input",s()([{attrs:{type:l,inputmode:o}},r]))},genLeftIcon:function(){var t=this.$createElement,e=this.slots("left-icon")||this.leftIcon;if(e)return t("div",{class:w("left-icon"),on:{click:this.onClickLeftIcon}},[this.slots("left-icon")||t(v["a"],{attrs:{name:this.leftIcon,classPrefix:this.iconPrefix}})])},genRightIcon:function(){var t=this.$createElement,e=this.slots,i=e("right-icon")||this.rightIcon;if(i)return t("div",{class:w("right-icon"),on:{click:this.onClickRightIcon}},[e("right-icon")||t(v["a"],{attrs:{name:this.rightIcon,classPrefix:this.iconPrefix}})])},genWordLimit:function(){var t=this.$createElement;if(this.showWordLimit&&this.maxlength){var e=this.value.length,i=e>=this.maxlength;return t("div",{class:w("word-limit")},[t("span",{class:w("word-num",{full:i})},[e]),"/",this.maxlength])}},genMessage:function(){var t=this.$createElement;if(!this.vanForm||!1!==this.vanForm.showErrorMessage){var e=this.errorMessage||this.validateMessage;if(e){var i=this.getProp("errorMessageAlign");return t("div",{class:w("error-message",i)},[e])}}},getProp:function(t){return Object(l["b"])(this[t])?this[t]:this.vanForm&&Object(l["b"])(this.vanForm[t])?this.vanForm[t]:void 0},genLabel:function(){var t=this.$createElement,e=this.getProp("colon")?":":"";return this.slots("label")?[this.slots("label"),e]:this.label?t("span",[this.label+e]):void 0}},render:function(){var t,e=arguments[0],i=this.slots,n=this.getProp("labelAlign"),s={icon:this.genLeftIcon},a=this.genLabel();a&&(s.title=function(){return a});var r=this.slots("extra");return r&&(s.extra=function(){return r}),e(p["a"],{attrs:{icon:this.leftIcon,size:this.size,center:this.center,border:this.border,isLink:this.isLink,required:this.required,clickable:this.clickable,titleStyle:this.labelStyle,valueClass:w("value"),titleClass:[w("label",n),this.labelClass],arrowDirection:this.arrowDirection},scopedSlots:s,class:w((t={error:this.showError},t["label-"+n]=n,t["min-height"]="textarea"===this.type&&!this.autosize,t)),on:{click:this.onClick}},[e("div",{class:w("body")},[this.genInput(),this.showClear&&e(v["a"],{attrs:{name:"clear"},class:w("clear"),on:{touchstart:this.onClear}}),this.genRightIcon(),i("button")&&e("div",{class:w("button")},[i("button")])]),this.genWordLimit(),this.genMessage()])}})},5852:function(t,e,i){"use strict";i("68ef"),i("9d70"),i("3743"),i("1a04"),i("1146"),i("f032")},6857:function(t,e,i){},9305:function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{},[n("div",{staticClass:"nav-box"},[n("div",{staticClass:"nav-left",on:{click:function(e){return t.toFront()}}},[n("img",{staticStyle:{width:"0.4rem",height:"0.42rem"},attrs:{src:i("e57c"),alt:""}})]),n("span",{staticClass:"nav-title",staticStyle:{opacity:"0.7"}},[t._v(t._s(t.title))]),n("div",{staticClass:"nav-right",on:{click:function(e){return t.toDetail()}}},["地址管理"==t.title?n("span",[t._v("管理")]):t._e()])])])},s=[],a={name:"navHead",props:{title:String},methods:{toFront:function(){console.log("111"),history.go(-1)},toDetail:function(){this.$router.push({path:"/personal/addressDel",query:{}})}}},r=a,o=(i("b905"),i("2877")),l=Object(o["a"])(r,n,s,!1,null,"09744484",null);e["a"]=l.exports},a8c1:function(t,e,i){"use strict";function n(t){return t===window}i.d(e,"d",(function(){return a})),i.d(e,"c",(function(){return r})),i.d(e,"h",(function(){return o})),i.d(e,"b",(function(){return l})),i.d(e,"g",(function(){return c})),i.d(e,"a",(function(){return u})),i.d(e,"e",(function(){return h})),i.d(e,"f",(function(){return d}));var s=/scroll|auto/i;function a(t,e){void 0===e&&(e=window);var i=t;while(i&&"HTML"!==i.tagName&&1===i.nodeType&&i!==e){var n=window.getComputedStyle(i),a=n.overflowY;if(s.test(a)){if("BODY"!==i.tagName)return i;var r=window.getComputedStyle(i.parentNode),o=r.overflowY;if(s.test(o))return i}i=i.parentNode}return e}function r(t){return"scrollTop"in t?t.scrollTop:t.pageYOffset}function o(t,e){"scrollTop"in t?t.scrollTop=e:t.scrollTo(t.scrollX,e)}function l(){return window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop||0}function c(t){o(window,t),o(document.body,t)}function u(t,e){if(n(t))return 0;var i=e?r(e):l();return t.getBoundingClientRect().top+i}function h(t){return n(t)?t.innerHeight:t.getBoundingClientRect().height}function d(t){return n(t)?0:t.getBoundingClientRect().top}},b905:function(t,e,i){"use strict";var n=i("1f67"),s=i.n(n);s.a},c3a6:function(t,e,i){"use strict";i("68ef"),i("9d70"),i("3743")},d961:function(t,e,i){"use strict";var n=i("2638"),s=i.n(n),a=i("c31d"),r=i("d282"),o=i("ba31"),l=i("1325"),c=i("565f"),u=Object(r["a"])("search"),h=u[0],d=u[1],f=u[2];function g(t,e,i,n){function r(){if(i.label||e.label)return t("div",{class:d("label")},[i.label?i.label():e.label])}function u(){if(e.showAction)return t("div",{class:d("action"),attrs:{role:"button",tabindex:"0"},on:{click:s}},[i.action?i.action():e.actionText||f("cancel")]);function s(){i.action||(Object(o["a"])(n,"input",""),Object(o["a"])(n,"cancel"))}}var h={attrs:n.data.attrs,on:Object(a["a"])(Object(a["a"])({},n.listeners),{},{keypress:function(t){13===t.keyCode&&(Object(l["c"])(t),Object(o["a"])(n,"search",e.value)),Object(o["a"])(n,"keypress",t)}})},g=Object(o["b"])(n);return g.attrs=void 0,t("div",s()([{class:d({"show-action":e.showAction}),style:{background:e.background}},g]),[null==i.left?void 0:i.left(),t("div",{class:d("content",e.shape)},[r(),t(c["a"],s()([{attrs:{type:"search",border:!1,value:e.value,leftIcon:e.leftIcon,rightIcon:e.rightIcon,clearable:e.clearable},scopedSlots:{"left-icon":i["left-icon"],"right-icon":i["right-icon"]}},h]))]),u()])}g.props={value:String,label:String,rightIcon:String,actionText:String,showAction:Boolean,background:String,shape:{type:String,default:"square"},clearable:{type:Boolean,default:!0},leftIcon:{type:String,default:"search"}},e["a"]=h(g)},e57c:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAADN0lEQVRYR9WZaW8TMRRF72P7wCZ2se////8AbenClm6CQIECxehEz2C5TiaT2KNiqWrUZjwnd+67fnZM/9mwmrwhhFOSrkn6KWlsZqHm/MxVG/iypOeSfktaM7PxiQUOIVx02DsO+VbSazP7XBO6isIhhEuSnki6J+mMA/6Q9EHSlqSPZobqS4+lgRPY+5JOZ0SHklYkbZjZ0dK0y3o4hIBnUfZuomzk+iVpT9KqpP1aBbiwwq7sM0l4NtoghZ14WNJBLTssnBJeYBH2bPaoefT4loL7UsMG6Ry9FXbYp26DHJbCAnbVzA5qw/ZW2D37OEuDyIWy7yW9bAXbC3iOAtuW9KKFDXpbwgss2iAvMJQdubJVF4mSpTo9HEI4LwnYB4U0wLPY4FXtFW2a/2cCOyxpQM6eyyaJsCsteobewCGEC67sLFjS4FOLNOgF7J6NaVDKWQoMGwwKW0yJJGfTRob30tt+l7TjrWPzAussOrcBylJgubL0Bu+8N6Cp6SzYBlY5+ntTh6WRoevKYbk3kLvsJLwrI96q7yimfEh2MsTn2EIIQFNg0bN5GqQrGSoDyQRDKcz9uNek+wP4iqSHU3qDBk914SkB3gb4uiSy9qYrt/CMjS9kYzsCGL9elfTIofNdQ+RgoeAn2mEoS6Q99mhyU/cx23OK7lZhq8PbJlt3Lz4KbkhgROL++2lK8Bql6RtK0HiIvmHNL27sgGPTU3z/Yi1TGk/fyJTmgq/eoK+bGZ948HHssSanN9iDQizthDclAc3KN+go+jDxNPYoQXPmsOHb929DEk8tnAwae+SNe4QeVOmufpj/kx6xEKnWdERodsgs3c1HZzS50iwu0R45NKBxp8wHaDo6gT09gAQ6FmIOTfEBzYllU+i5gAvQeeTxFpRe90JsZo+5gRPo6Olp0BxPbbbydC/gZHGJni5BY48IXd0evYETaGApRH6XPA30Vm2lFwLOoGcVIieY5DRLepWxMPCc6QEoB9pvTsSBdkd60DuzB4wH2ifjK4MsPWKXx585DsDHu7VO35l0KUukpvQVkUYJaNRE2b2asFWBXWkapNve4O/U/KogilNN4SoRMMckfwBm3y0x1cy3BgAAAABJRU5ErkJggg=="},f032:function(t,e,i){},f766:function(t,e,i){"use strict";var n=i("6857"),s=i.n(n);s.a}}]);
//# sourceMappingURL=chunk-f60b8f7e.fd27e8d3.js.map