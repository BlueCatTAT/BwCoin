(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-58c91782"],{"1f67":function(t,e,s){},"30ad":function(t,e,s){"use strict";s.r(e);var a=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"film-box",staticStyle:{height:"100%"}},[a("div",{staticClass:"content",staticStyle:{"padding-top":"1rem"},style:{minHeight:t.curHeight+"px"}},[a("div",{staticClass:"hedeBox",staticStyle:{position:"fixed",left:"0",top:"0",width:"100%","z-index":"10"}},[a("nav-head",{attrs:{title:"zh"==t.languageStatus?"新币参与":"SGD participation"}})],1),a("div",{staticStyle:{}},t._l(t.list,(function(e,i){return a("div",{key:i,staticClass:"item"},[a("div",{staticClass:"thead"},[a("div",{staticClass:"left-box"},[a("img",{staticClass:"left-img",attrs:{src:s("a1c5"),alt:""}}),a("span",{staticClass:"title-text"},[t._v(t._s(e.currency_name))])]),a("div",{staticClass:"right-box"},[e.unfreeze===e.freeze_status?a("span",{staticClass:"jieshu"},[t._v(" "+t._s(e.unfreeze==e.freeze_status?"完成":"解冻中"))]):a("span",{staticClass:"implement"},[t._v(t._s(t.$t("common.jiedongzhong")))])])]),a("div",{staticClass:"mian-box"},[t._m(0,!0),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.xiangmumingcheng"))),a("span",[t._v(" "+t._s(e.title))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.danjia"))),a("span",[t._v(" "+t._s(e.price)+" "+t._s(e.x_currency_name))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.number"))),a("span",[t._v(" "+t._s(e.num))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.zhifuzonge"))),a("span",{staticClass:"red-font"},[t._v(" "+t._s(e.price*e.num)+" "+t._s(e.x_currency_name))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.jiedongjiange"))),a("span",[t._v(" "+t._s(e.financial_cycle)+t._s(e.time_type))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.canyushijian"))),a("span",[t._v(" "+t._s(e.create_time))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.jiedongzhuangtai"))),a("span",{staticClass:"red-font"},[t._v(" "+t._s(e.unfreeze)+"/"+t._s(e.freeze_status))])]),a("p",{staticClass:"xm-name"},[t._v(t._s(t.$t("common.shangcijiedong"))+" "),"en"==t.languageStatus?a("span",[t._v(" "+t._s(null==e.freeze_time?"Not yet thawed":t.format(e.freeze_time)))]):a("span",[t._v(" "+t._s(null==e.freeze_time?"":t.format(e.freeze_time)))])])])])})),0)])])},i=[function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"row-1"},[s("div",{staticClass:"tt"})])}],n=s("c24f"),o=s("5f87"),c=s("9305"),l={components:{NavHead:c["a"]},data:function(){return{url:this.GLOBAL.domainName,languageStatus:"zh",curHeight:"",list:[],parameter:{u_id:"2",activity:"newcoin"},title:"新币参与"}},created:function(){var t=Object(o["b"])(this.parameter),e=Object(o["c"])(t);this.parameter.token=e,this.voteList(this.parameter),this.beforeMount(),this.getLanguageStatus()},methods:{getLanguageStatus:function(){console.log(this.$store.state.language),this.languageStatus=this.$store.state.language},beforeMount:function(t){var e=document.documentElement.clientHeight||document.body.clientHeight;this.curHeight=e,console.log(this.curHeight,"this.curHeight")},add0:function(t){return t<10?"0"+t:t},format:function(t){var e=1e3*t,s=new Date(e),a=s.getFullYear(),i=s.getMonth()+1,n=s.getDate(),o=s.getHours(),c=s.getMinutes();return a+"-"+this.add0(i)+"-"+this.add0(n)+" "+this.add0(o)+":"+this.add0(c)},voteList:function(t){var e=this;Object(n["M"])(t).then((function(t){console.log(t,e),e.list=t.data})).catch((function(t){return console.log(t)}))}}},r=l,u=(s("c3ef"),s("2877")),g=Object(u["a"])(r,a,i,!1,null,"73c1f89c",null);e["default"]=g.exports},4993:function(t,e,s){},9305:function(t,e,s){"use strict";var a=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{},[a("div",{staticClass:"nav-box"},[a("div",{staticClass:"nav-left",on:{click:function(e){return t.toFront()}}},[a("img",{staticStyle:{width:"0.4rem",height:"0.42rem"},attrs:{src:s("e57c"),alt:""}})]),a("span",{staticClass:"nav-title",staticStyle:{opacity:"0.7"}},[t._v(t._s(t.title))]),a("div",{staticClass:"nav-right",on:{click:function(e){return t.toDetail()}}},["地址管理"==t.title?a("span",[t._v("管理")]):t._e()])])])},i=[],n={name:"navHead",props:{title:String},methods:{toFront:function(){console.log("111"),history.go(-1)},toDetail:function(){this.$router.push({path:"/personal/addressDel",query:{}})}}},o=n,c=(s("b905"),s("2877")),l=Object(c["a"])(o,a,i,!1,null,"09744484",null);e["a"]=l.exports},a1c5:function(t,e){t.exports="data:image/png;base64,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"},b905:function(t,e,s){"use strict";var a=s("1f67"),i=s.n(a);i.a},c3ef:function(t,e,s){"use strict";var a=s("4993"),i=s.n(a);i.a},e57c:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAADN0lEQVRYR9WZaW8TMRRF72P7wCZ2se////8AbenClm6CQIECxehEz2C5TiaT2KNiqWrUZjwnd+67fnZM/9mwmrwhhFOSrkn6KWlsZqHm/MxVG/iypOeSfktaM7PxiQUOIVx02DsO+VbSazP7XBO6isIhhEuSnki6J+mMA/6Q9EHSlqSPZobqS4+lgRPY+5JOZ0SHklYkbZjZ0dK0y3o4hIBnUfZuomzk+iVpT9KqpP1aBbiwwq7sM0l4NtoghZ14WNJBLTssnBJeYBH2bPaoefT4loL7UsMG6Ry9FXbYp26DHJbCAnbVzA5qw/ZW2D37OEuDyIWy7yW9bAXbC3iOAtuW9KKFDXpbwgss2iAvMJQdubJVF4mSpTo9HEI4LwnYB4U0wLPY4FXtFW2a/2cCOyxpQM6eyyaJsCsteobewCGEC67sLFjS4FOLNOgF7J6NaVDKWQoMGwwKW0yJJGfTRob30tt+l7TjrWPzAussOrcBylJgubL0Bu+8N6Cp6SzYBlY5+ntTh6WRoevKYbk3kLvsJLwrI96q7yimfEh2MsTn2EIIQFNg0bN5GqQrGSoDyQRDKcz9uNek+wP4iqSHU3qDBk914SkB3gb4uiSy9qYrt/CMjS9kYzsCGL9elfTIofNdQ+RgoeAn2mEoS6Q99mhyU/cx23OK7lZhq8PbJlt3Lz4KbkhgROL++2lK8Bql6RtK0HiIvmHNL27sgGPTU3z/Yi1TGk/fyJTmgq/eoK+bGZ948HHssSanN9iDQizthDclAc3KN+go+jDxNPYoQXPmsOHb929DEk8tnAwae+SNe4QeVOmufpj/kx6xEKnWdERodsgs3c1HZzS50iwu0R45NKBxp8wHaDo6gT09gAQ6FmIOTfEBzYllU+i5gAvQeeTxFpRe90JsZo+5gRPo6Olp0BxPbbbydC/gZHGJni5BY48IXd0evYETaGApRH6XPA30Vm2lFwLOoGcVIieY5DRLepWxMPCc6QEoB9pvTsSBdkd60DuzB4wH2ifjK4MsPWKXx585DsDHu7VO35l0KUukpvQVkUYJaNRE2b2asFWBXWkapNve4O/U/KogilNN4SoRMMckfwBm3y0x1cy3BgAAAABJRU5ErkJggg=="}}]);
//# sourceMappingURL=chunk-58c91782.af5008a7.js.map