(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-0bce3158"],{"0a26":function(t,e,i){"use strict";i.d(e,"a",(function(){return r}));var a=i("ad06"),n=i("78eb"),s=i("9884"),o=i("ea8e"),r=function(t){var e=t.parent,i=t.bem,r=t.role;return{mixins:[Object(s["a"])(e),n["a"]],props:{name:null,value:null,disabled:Boolean,iconSize:[Number,String],checkedColor:String,labelPosition:String,labelDisabled:Boolean,shape:{type:String,default:"round"},bindGroup:{type:Boolean,default:!0}},computed:{disableBindRelation:function(){return!this.bindGroup},isDisabled:function(){return this.parent&&this.parent.disabled||this.disabled},direction:function(){return this.parent&&this.parent.direction||null},iconStyle:function(){var t=this.checkedColor||this.parent&&this.parent.checkedColor;if(t&&this.checked&&!this.isDisabled)return{borderColor:t,backgroundColor:t}},tabindex:function(){return this.isDisabled||"radio"===r&&!this.checked?-1:0}},methods:{onClick:function(t){var e=this,i=t.target,a=this.$refs.icon,n=a===i||a.contains(i);this.isDisabled||!n&&this.labelDisabled?this.$emit("click",t):(this.toggle(),setTimeout((function(){e.$emit("click",t)})))},genIcon:function(){var t=this.$createElement,e=this.checked,n=this.iconSize||this.parent&&this.parent.iconSize;return t("div",{ref:"icon",class:i("icon",[this.shape,{disabled:this.isDisabled,checked:e}]),style:{fontSize:Object(o["a"])(n)}},[this.slots("icon",{checked:e})||t(a["a"],{attrs:{name:"success"},style:this.iconStyle})])},genLabel:function(){var t=this.$createElement,e=this.slots();if(e)return t("span",{class:i("label",[this.labelPosition,{disabled:this.isDisabled}])},[e])}},render:function(){var t=arguments[0],e=[this.genIcon()];return"left"===this.labelPosition?e.unshift(this.genLabel()):e.push(this.genLabel()),t("div",{attrs:{role:r,tabindex:this.tabindex,"aria-checked":String(this.checked)},class:i([{disabled:this.isDisabled,"label-disabled":this.labelDisabled},this.direction]),on:{click:this.onClick}},[e])}}}},"0a6e":function(t,e,i){},2381:function(t,e,i){},"2e9b":function(t,e,i){"use strict";var a=i("590b"),n=i.n(a);n.a},"3acc":function(t,e,i){"use strict";var a=i("d282"),n=i("78eb"),s=i("9884"),o=Object(a["a"])("checkbox-group"),r=o[0],c=o[1];e["a"]=r({mixins:[Object(s["b"])("vanCheckbox"),n["a"]],props:{max:[Number,String],disabled:Boolean,direction:String,iconSize:[Number,String],checkedColor:String,value:{type:Array,default:function(){return[]}}},watch:{value:function(t){this.$emit("change",t)}},methods:{toggleAll:function(t){if(!1!==t){var e=this.children;t||(e=e.filter((function(t){return!t.checked})));var i=e.map((function(t){return t.name}));this.$emit("input",i)}else this.$emit("input",[])}},render:function(){var t=arguments[0];return t("div",{class:c([this.direction])},[this.slots()])}})},"3c32":function(t,e,i){"use strict";i("68ef"),i("9d70"),i("3743"),i("2381")},"417e":function(t,e,i){"use strict";var a=i("d282"),n=i("0a26"),s=Object(a["a"])("checkbox"),o=s[0],r=s[1];e["a"]=o({mixins:[Object(n["a"])({bem:r,role:"checkbox",parent:"vanCheckbox"})],computed:{checked:{get:function(){return this.parent?-1!==this.parent.value.indexOf(this.name):this.value},set:function(t){this.parent?this.setParentValue(t):this.$emit("input",t)}}},watch:{value:function(t){this.$emit("change",t)}},methods:{toggle:function(t){var e=this;void 0===t&&(t=!this.checked),clearTimeout(this.toggleTask),this.toggleTask=setTimeout((function(){e.checked=t}))},setParentValue:function(t){var e=this.parent,i=e.value.slice();if(t){if(e.max&&i.length>=e.max)return;-1===i.indexOf(this.name)&&(i.push(this.name),e.$emit("input",i))}else{var a=i.indexOf(this.name);-1!==a&&(i.splice(a,1),e.$emit("input",i))}}}})},"590b":function(t,e,i){},"78eb":function(t,e,i){"use strict";i.d(e,"a",(function(){return a}));var a={inject:{vanField:{default:null}},watch:{value:function(){var t=this.vanField;t&&(t.resetValidation(),t.validateWithTrigger("onChange"))}},created:function(){var t=this.vanField;t&&!t.children&&(t.children=this)}}},"939d":function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAADl0lEQVRYR9WZ6W9VRRiHn1fAhW+uH0xEQKMRVwyLQPjfZRMFBCLEraUlEMLSNAZQFlnGPGSOGYZz6b3tnFOYpGk/3DvznN/5vb95Zxq8ZCNa8qaUNgJbgHvA1YhILed3rmbAKSXneg84CDwEfoyIay8y8LvAAWAHoLLngRMRcb0ldBOFU0oquxf4Eng1A94B/gDOAFci4lEL8DUBZxuo7B7ga2BTBfU3cBQ4HRH/ritw4VmV/aJQtuMScBH4AbgcEY/XDbhQdh/w+QRYPfwTsBwRFmGTsSpLpJTeyQX2GfB6RfIAOJtTYrkJZTHJzMAZdn9OgxpWJYU9HhHNYWfK4cKzu3MavNaj7G/AoaFgpwaessDmgO8jYqm1Dcr5prLEhJzt5tGz5u0R4MYQ2/FMwCmlt4DvgG960kDP/g4cBpaGhl3REimlNwELzJx9o3rV7lx69ugQPcMkW020RErp7WK7nQR7LCKuDunZeu5ngItNoUuDvuj6U8+ODdtriZSSvYGe1QZldNmB3QIu5JwdNA2mskS2gcrurGD9vr3Br8AxwKZmqoRpaBcFe/T/ojkNbGS+6ikw1/0HWADsb20h7cyanygmPKAnGQW7HimlVwCjyxZRG2ye8CUjzKOPkBtGVlhhn3R/Ar8PfJu7rjoNGr7RNU91H5gXeCtgm/hxVm7NMw80wV1gTmBj6wNgF7C959TQre9G4Y920Ea+prE87FoqPPek6FJKQght0al0fdTxYz7hjZwQFp3QYw2LzvUvlSkhgHcKFt8ngB8qh09orHmK8IA5Zqy5lkesB08tWiitpz+qoP3CX7lBPxkRJsboo29r1h4qrT2E7jsJe3QX2p1v1NH7WnM2C+0W3QetJX4GTkXEzTGJn9etdZ4W2vToLkg6vg7a253bY0E/t3AqpU2PuhA7aO/R3LoHHytWeoZ2c+mUrqEFPZ2P9YNDrwicc1rIDzP0th6l7d4sxMGVngq42FxU2vTQ07XSQp/Khejfg4ypgQvoUum+yDuRL/8GgZ4JOEObHl3D5O8a2sTooJt7embgyh4WYu1pGyKhT+ZivNPy+L8q4B5oPe0OWQ6hz+Ud0S29yVg1cJUe3TZeQwvqGfCXdb/Q7uTKDZNetssrGyZ75+5C+1KrO+I1KVxBmx52eXraeedz8S22un13vSbAhaf1stCq678KLrYsuKbAGdqLl0/z6XqhlQ3Kam2mcJMImGKS/wCC4DPm0DFvQgAAAABJRU5ErkJggg=="},a1d8:function(t,e,i){t.exports=i.p+"img/logo.80525f99.png"},a909:function(t,e,i){"use strict";i("68ef"),i("0a6e")},b953:function(t,e,i){"use strict";i.r(e);var a=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"film-box",staticStyle:{height:"100%"}},[a("div",{staticClass:"content",style:{minHeight:t.curHeight+"px"}},[a("div",{staticClass:"top"},[a("img",{staticClass:"back",attrs:{src:i("939d"),alt:""},on:{click:function(e){return t.isback()}}})]),a("div",{staticClass:"middle-box"},[a("div",{staticClass:"main"},[t._m(0),a("div",{staticClass:"form"},[a("p",{staticClass:"logo-text"},[t._v("注册")]),a("div",{staticClass:"username-box"},[a("img",{staticStyle:{"margin-left":"0"},attrs:{src:i("d62f"),alt:""}}),a("input",{directives:[{name:"model",rawName:"v-model",value:t.parameter.tel,expression:"parameter.tel"}],staticClass:"username",attrs:{type:"number",placeholder:"手机号 / 邮箱"},domProps:{value:t.parameter.tel},on:{input:function(e){e.target.composing||t.$set(t.parameter,"tel",e.target.value)}}})]),a("div",{staticClass:"username-box"},[a("img",{staticStyle:{"margin-left":"0"},attrs:{src:i("ffd7"),alt:""}}),a("input",{directives:[{name:"model",rawName:"v-model",value:t.parameter.password,expression:"parameter.password"}],staticClass:"username",attrs:{type:"password",placeholder:"请输入密码"},domProps:{value:t.parameter.password},on:{input:function(e){e.target.composing||t.$set(t.parameter,"password",e.target.value)}}})]),a("div",{staticClass:"username-box"},[a("img",{staticStyle:{"margin-left":"0"},attrs:{src:i("ffd7"),alt:""}}),a("input",{directives:[{name:"model",rawName:"v-model",value:t.validity.lockcode,expression:"validity.lockcode"}],staticClass:"username",attrs:{type:"number",placeholder:"请输入短信验证码"},domProps:{value:t.validity.lockcode},on:{input:function(e){e.target.composing||t.$set(t.validity,"lockcode",e.target.value)}}}),a("div",{staticClass:"userCode",on:{click:function(e){return t.sendCode()}}},[t._v(t._s(t.vcodeBtnName))])]),a("div",{staticClass:"username-box"},[a("img",{staticStyle:{"margin-left":"0"},attrs:{src:i("ffd7"),alt:""}}),a("input",{directives:[{name:"model",rawName:"v-model",value:t.code,expression:"code"}],staticClass:"username",attrs:{type:"number",placeholder:"请输入邀请码"},domProps:{value:t.code},on:{input:function(e){e.target.composing||(t.code=e.target.value)}}})])]),a("div",{staticClass:"logo-btn",on:{click:function(e){return t.userRegister()}}},[t._v("注册")])]),a("div",{staticClass:"footer"},[t._v(" 已有账号？ "),a("span",{staticStyle:{color:"#079FDC"},on:{click:function(e){return t.tologin()}}},[t._v("立即登录")])])])])])},n=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"logo"},[a("img",{attrs:{src:i("a1d8"),alt:""}})])}],s=(i("3c32"),i("417e")),o=(i("a909"),i("3acc")),r=(i("e7e5"),i("d399")),c=i("2b0e"),l=i("5f87"),u=i("c24f");c["a"].use(s["a"]).use(o["a"]).use(r["a"]);var d={components:{},data:function(){return{checked:!0,vcodeBtnName:"获取验证码",parameter:{tel:"",password:"",code:""},datas:{tel:""},validity:{tel:"",lockcode:""},verificationCode:"",countNum:"",code:"",curHeight:""}},created:function(){this.beforeMount()},methods:{beforeMount:function(t){var e=document.documentElement.clientHeight||document.body.clientHeight;this.curHeight=e},isback:function(){this.$router.go(-1)},userRegister:function(){var t=this;""!==t.parameter.tel?/^[0-9]{11}$/.test(t.parameter.tel)?""!==t.parameter.password?""!==t.validity.lockcode?this.verifySms():t.$toast({message:"请输入验证码",duration:1500}):t.$toast({message:"请输入密码",duration:1500}):t.$toast({message:"请输入正确手机号",duration:1500}):t.$toast({message:"手机号不能为空",duration:1500})},tologin:function(){this.$router.push({path:"/login",query:{}})},countDown:function(){if(this.countNum<1)return clearInterval(this.countDownTimer),void(this.vcodeBtnName="重新发送");this.countNum--,this.vcodeBtnName=this.countNum+"秒重发"},verifySms:function(){var t=this,e=this;e.validity.tel=e.parameter.tel;var i=Object(l["b"])(e.validity),a=Object(l["c"])(i);e.validity.token=a,Object(u["k"])(e.validity).then((function(i){if(console.log(i,"验证成功"),0===i.code){""===e.code?e.parameter.code=0:e.parameter.code=e.code;var a=Object(l["b"])(t.parameter),n=Object(l["c"])(a);t.parameter.token=n,e.transactionList(t.parameter),delete t.validity.token}})).catch((function(i){e.$toast({message:i,duration:1500}),delete t.validity.token}))},sendCode:function(){var t=this,e=this;if(""!==e.parameter.tel)if(/^[0-9]{11}$/.test(e.parameter.tel)){if("获取验证码"===e.vcodeBtnName||"重新发送"===e.vcodeBtnName){e.countNum=120,e.countDownTimer=setInterval(function(){this.countDown()}.bind(this),1e3),e.datas.tel=e.parameter.tel;var i=Object(l["b"])(e.datas),a=Object(l["c"])(i);e.datas.token=a,Object(u["W"])(this.datas).then((function(i){console.log(i,"发送短信1"),0===i.code&&(e.$toast({message:"短信已发送，请注意查收",duration:1500}),delete t.datas.token)})).catch((function(i){e.$toast({message:i,duration:1500}),delete t.datas.token}))}}else e.$toast({message:"请输入正确手机号",duration:1500});else e.$toast({message:"手机号不能为空",duration:1500})},transactionList:function(t){var e=this,i=this;Object(u["l"])(t).then((function(t){console.log(t,"注册成功"),0===t.code&&(i.$toast({message:"注册成功",duration:1500}),setTimeout((function(){i.$router.go(-1)}),1500),i.parameter.tel="",i.parameter.password="",i.validity.lockcode="",i.parameter.code=0,delete e.parameter.token)})).catch((function(t){i.$toast({message:t,duration:1500}),i.parameter.tel="",i.parameter.password="",i.validity.lockcode="",i.parameter.code=0,delete e.parameter.token}))}}},h=d,m=(i("2e9b"),i("2877")),g=Object(m["a"])(h,a,n,!1,null,"4c4706d0",null);e["default"]=g.exports},d62f:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAADjUlEQVRYR82XXWhcVRSFv31nYhKaSUFfghT0YcQH8UFBUSu1WkXERIzSUMFiS6RUMKEYaK1oJNVA00Jti/iDUEu1UaxGI1LU1lpaiiJWad8kKMQHKQiVmJCf+blLJuiDdmbuPjeD9Lyetdf6zj73nnuucZkPu8z5aCzgei1jniJHrNCohS8JsL1XV5rRa0YXxk2ItgqYjAsmvhG8PzXBGCetlBY4JaCsfTNbTAwBuXrhgp9i2DTzpp1KAxkO2Kfm5SVGgUe8gYKyib6pN+x1b80/umDA9qc1auKx0KDKzst4/M9XrbI49wgCzPXrCRMH3e6XCmcKxg3z++1Xr4cfsE/NuQy/GFztNa+mExyc3msbvR5uwLZntDaCD7zGtXQy5qezdDBiUx4vN2Buqw4g3CuvG250T++yTxoL+Ky+A27xmCZpBIMzO+2lJF1l3t3Btuc0gZH3mCZpDPZMD9tAki4IcNmgzhvc6DF1aIZndtjzDl1AB3foY8TDHtMkTWz0zg7agSRdWAdf1hbgFY9pkqYk8gsv2M9JujDAXepQmUkzrvAY1zlmzsxuszu9Hu6XpGLYulv7DPq95tV0ccS98wP2ldcjCJAR5VqbOGtwnTfgXzrx1uyAbQqpDQMEmvcoH2X5GrEiJEhwdP4i3QyFXWaDARe3er9WkOEwsMoBGSP2zv3ONobCL66pABehJGt9jR5F9GPcXuXQnyPm07IxUnzKfnQspKpkSYAtb7NKMZ1Al4nr/5PwLXCibIwXn7TKZzLVCAd8UVHLtWyQ2A7uT985GcOFjXYklDIIsPkd5RVz2IxbQ4P+1h9bKLKBXvvNW+8GzI7qnkiMAcu95lV14oKyPFhcZz94fFyA2fe02oyjBq0e0ySN4A/g7uI6O5ekTQb8SNc0ibMmrkoyC5o3JgsxN9NjF+vVJQJmx3TcYE1QuFdsvFvstvWpATPjeiiCcW9eCp2IuK3YVfsYqtvB7Gc6A9yRIjikZKzUaY/WKqgN+Lny2ZiJkKSU2kIppoNOq7w4l4yagNEX6o9gX8rQoDLF9JQfqH6I1wTMHNMhoO4DHERRRyzYHd9nW4M6mDmh0wj3zXeJsB+W19jaIMDopM6bGvYXV5/f+LK82u4PAzylQ+j/2WJge3yX7QwC5Hs1McdKoGWx0FhAqGorojpzZRaoXFmrjZbFuVlW2mT4MbPEh6pR5YmfukYFpfX5C5vzFThHsHfoAAAAAElFTkSuQmCC"},ffd7:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAEM0lEQVRYR83YfWiVVRzA8e/vuS/uXcEi1x+1hGJgUFTQC1r2aim0hoOFSVlKVutNLbNXHQYpmtai0YvhYDEyXKgrlr1MoxIroj+iiAq99OKMoPJu82733uf5xTO2tbuee59ztjE8f97nnPP7nN+55zznOcIpXmSivhl36QWew1yU2SKUAH2qHHEjfNr3mnw70f7HCVRnxkruUGWtKNUFEN95sDn5Om+C6Hiw1sDS+3RWxONtUeYZBxS63AFu7d0pfxq3GapoBfRxUeVzYLZtIBV+9FLMtUVaAFWmN3AQuDIAd0KVQwh/ALMErgAqxtZT+DD5stxgMzhj4PT7tV6Ft8Z03gs8nuxhBy3SP/JslRZXZLhHhGeVwYUzUlS4padJ9poijYHlD2mXwNWjOu4VZf6JJvk6X7CK1XoZLh+Ti+xMvigLJxd4t8bKy+gViA93rPBozzbZGhaobJU+5QgbR9XrS26j3HRVG2WwZK2eGVF+H42RLOcmt8vPocBH9HwRcvZDyTIzuV3+CmvrPzcCFq3TqphydHSHnkdl3xY5HhZkIm3tgM4YYMYMOJj9aE72tcdjJpvk77DBWQGjsVygOlT2NYZn0A9S+rS+L7BgCNTeu1HqTHDmwPVaFZUxQDUHsl7jZUqNC9mU0EGjZCcdGInmAslaAE01AfUKL5ItWlqSpVpdznIc3snZcGGRehitxCCfCOmTGX5gg5ws5M8LLN6sawQa/b/QBBJQsKkIPZ7Hk6l18lK+ioHAoq16myP+EWlqikJdao20B2Y66MfiF/QwcOnU8AajHEw9LKNfoyOhAzNY3KTHECqnEHg09YAEHuGCgc3a7R+bpgwoJFL3yjnGU1z0qh1Qhf3qsTMCvwBVKiwHrrUYYKJ/pQ3wDQug8kT/CnluLKZohzYiPGOITPQvtwBOazEGfjawTPJ8m6jEW/hS4BIDZGJgmQ2w1RAoNAwsleZ8gGmtuhp4PhSoJAZutwG2abeaLZK69JLg/ctHxdt0KdAaCoREeokFML7LMIOwIV0v/tsmsMR36SbgMSNgvQ1wt1kGRTiWdphDrfzzP0SbnhaL8z1wehhQ/AzWWQCje7Rb1HgfPJTxqGex/DYCadezYw7+q+viMNzQ80Sm1ga4zwqICnuyN0vtMCa6VzsFbjTE+dUSmRoLYOQ9OyAO+7ILpWYE+K5+AFxvClQh4S6yAXZqt5it4kGDwq/ucc7jTumnQ0siEY6IcIYxEBLuTTbA/XbAIcgXOHTg4U+16X9veIAJd4EF0PnIcopNU5Wnnj/F3nU2wC79RpQLJxjXvLlw2L1GLg9qEHjccg4MHvdDrzXMBYVrqtDgzQ9+ZQZ/k6g6zie8gsMK1Oz2YVxYwQOavXk8iATfwBb+qjug1cS4KOL9d2k0LkhAI1dJA19xlfxUqE+ju5nJQo2nn1Me+C8r44Q4fCPmJgAAAABJRU5ErkJggg=="}}]);
//# sourceMappingURL=chunk-0bce3158.472cc104.js.map