"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[329],{3905:(e,t,l)=>{l.d(t,{Zo:()=>d,kt:()=>k});var a=l(67294);function i(e,t,l){return t in e?Object.defineProperty(e,t,{value:l,enumerable:!0,configurable:!0,writable:!0}):e[t]=l,e}function n(e,t){var l=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),l.push.apply(l,a)}return l}function r(e){for(var t=1;t<arguments.length;t++){var l=null!=arguments[t]?arguments[t]:{};t%2?n(Object(l),!0).forEach((function(t){i(e,t,l[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(l)):n(Object(l)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(l,t))}))}return e}function u(e,t){if(null==e)return{};var l,a,i=function(e,t){if(null==e)return{};var l,a,i={},n=Object.keys(e);for(a=0;a<n.length;a++)l=n[a],t.indexOf(l)>=0||(i[l]=e[l]);return i}(e,t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);for(a=0;a<n.length;a++)l=n[a],t.indexOf(l)>=0||Object.prototype.propertyIsEnumerable.call(e,l)&&(i[l]=e[l])}return i}var o=a.createContext({}),s=function(e){var t=a.useContext(o),l=t;return e&&(l="function"==typeof e?e(t):r(r({},t),e)),l},d=function(e){var t=s(e.components);return a.createElement(o.Provider,{value:t},e.children)},p="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},c=a.forwardRef((function(e,t){var l=e.components,i=e.mdxType,n=e.originalType,o=e.parentName,d=u(e,["components","mdxType","originalType","parentName"]),p=s(l),c=i,k=p["".concat(o,".").concat(c)]||p[c]||m[c]||n;return l?a.createElement(k,r(r({ref:t},d),{},{components:l})):a.createElement(k,r({ref:t},d))}));function k(e,t){var l=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var n=l.length,r=new Array(n);r[0]=c;var u={};for(var o in t)hasOwnProperty.call(t,o)&&(u[o]=t[o]);u.originalType=e,u[p]="string"==typeof e?e:i,r[1]=u;for(var s=2;s<n;s++)r[s]=l[s];return a.createElement.apply(null,r)}return a.createElement.apply(null,l)}c.displayName="MDXCreateElement"},42094:(e,t,l)=>{l.r(t),l.d(t,{assets:()=>o,contentTitle:()=>r,default:()=>m,frontMatter:()=>n,metadata:()=>u,toc:()=>s});var a=l(87462),i=(l(67294),l(3905));const n={sidebar_position:6},r="Migrating From Llama",u={unversionedId:"MigratingFromLlama",id:"MigratingFromLlama",title:"Migrating From Llama",description:"Freeze is close to a drag-and-drop replacement for projects that currently use Llama, however",source:"@site/docs/MigratingFromLlama.md",sourceDirName:".",slug:"/MigratingFromLlama",permalink:"/Freeze/docs/MigratingFromLlama",draft:!1,editUrl:"https://github.com/benbrimeyer/Freeze/edit/master/docs/MigratingFromLlama.md",tags:[],version:"current",sidebarPosition:6,frontMatter:{sidebar_position:6},sidebar:"defaultSidebar",previous:{title:"Examples And Usecases",permalink:"/Freeze/docs/ExamplesAndUsecases"}},o={},s=[{value:"Llama",id:"llama",level:2},{value:".equalObjects",id:"equalobjects",level:3},{value:".Dictionary",id:"dictionary",level:2},{value:".copy",id:"copy",level:3},{value:".copyDeep",id:"copydeep",level:3},{value:".equals",id:"equals",level:3},{value:".equalsDeep",id:"equalsdeep",level:3},{value:".fromLists",id:"fromlists",level:3},{value:".mergeDeep",id:"mergedeep",level:3},{value:".removeKeys",id:"removekeys",level:3},{value:".removeValues",id:"removevalues",level:3},{value:".update",id:"update",level:3},{value:"List",id:"list",level:2},{value:".concatDeep",id:"concatdeep",level:3},{value:".copy",id:"copy-1",level:3},{value:".copyDeep",id:"copydeep-1",level:3},{value:".create",id:"create",level:3},{value:".equals",id:"equals-1",level:3},{value:".equalsDeep",id:"equalsdeep-1",level:3},{value:".find",id:"find",level:3},{value:".findLast",id:"findlast",level:3},{value:".findWhere",id:"findwhere",level:3},{value:".findWhereLast",id:"findwherelast",level:3},{value:".insert",id:"insert",level:3},{value:".join",id:"join",level:3},{value:".removeIndices",id:"removeindices",level:3},{value:".removeValues",id:"removevalues-1",level:3},{value:".set",id:"set",level:3},{value:".slice",id:"slice",level:3},{value:".splice",id:"splice",level:3},{value:".toSet",id:"toset",level:3},{value:".update",id:"update-1",level:3},{value:".zipAll",id:"zipall",level:3},{value:"Set",id:"set-1",level:2}],d={toc:s},p="wrapper";function m(e){let{components:t,...l}=e;return(0,i.kt)(p,(0,a.Z)({},d,l,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"migrating-from-llama"},"Migrating From Llama"),(0,i.kt)("p",null,"Freeze is close to a drag-and-drop replacement for projects that currently use ",(0,i.kt)("a",{parentName:"p",href:"https://github.com/freddylist/llama"},"Llama"),", however\nyou'll need to be aware of incompatible changes."),(0,i.kt)("p",null,"Feel free to file an issue if you'd like to start a discussion on any items from this list."),(0,i.kt)("h1",{id:"deviations"},"Deviations"),(0,i.kt)("p",null,"The following is a list of deviations between Freeze and Llama:"),(0,i.kt)("h2",{id:"llama"},"Llama"),(0,i.kt)("h3",{id:"equalobjects"},".equalObjects"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h2",{id:"dictionary"},".Dictionary"),(0,i.kt)("h3",{id:"copy"},".copy"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Use ",(0,i.kt)("inlineCode",{parentName:"li"},"table.clone")," instead.")),(0,i.kt)("h3",{id:"copydeep"},".copyDeep"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented. Reconsider if you really need this.")),(0,i.kt)("h3",{id:"equals"},".equals"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"[Freeze.Dictionary.equals]"," will perform ",(0,i.kt)("strong",{parentName:"li"},"value-equality")," instead of ",(0,i.kt)("strong",{parentName:"li"},"reference-equality"),"."),(0,i.kt)("li",{parentName:"ul"},"[Freeze.Dictionary.equals]"," only accepts two objects to compare between instead of varags arguments")),(0,i.kt)("h3",{id:"equalsdeep"},".equalsDeep"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h3",{id:"fromlists"},".fromLists"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h3",{id:"mergedeep"},".mergeDeep"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h3",{id:"removekeys"},".removeKeys"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Use ","[Dictionary.remove]"," instead.")),(0,i.kt)("h3",{id:"removevalues"},".removeValues"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Use ","[Dictionary.removeValue]"," instead.")),(0,i.kt)("h3",{id:"update"},".update"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[Dictionary.update]"," requires an updater function while Llama's was optional."),(0,i.kt)("li",{parentName:"ul"},"Freeze.","[Dictionary.update]","'s updater signature is ",(0,i.kt)("inlineCode",{parentName:"li"},"(Value) -> (Value)")," instead of Llama's ",(0,i.kt)("inlineCode",{parentName:"li"},"(Value, Key) -> (Value)"),"."),(0,i.kt)("li",{parentName:"ul"},"[Dictionary.update]"," final argument is ",(0,i.kt)("inlineCode",{parentName:"li"},"notSetValue")," instead of a ",(0,i.kt)("inlineCode",{parentName:"li"},"callback")," function.")),(0,i.kt)("pre",null,(0,i.kt)("code",{parentName:"pre",className:"language-lua"},'-- Freeze\nFreeze.Dictionary.update(dictionary, key, function(value)\n    return string.upper(value)\nend, "default value")\n\n-- Llama\nLlama.Dictionary.update(dictionary, key, function(value, key)\n    return string.upper(value)\nend, function(key)\n    return "default value"\nend)\n')),(0,i.kt)("h2",{id:"list"},"List"),(0,i.kt)("h3",{id:"concatdeep"},".concatDeep"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h3",{id:"copy-1"},".copy"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented. Consider ",(0,i.kt)("inlineCode",{parentName:"li"},"table.clone")," instead.")),(0,i.kt)("h3",{id:"copydeep-1"},".copyDeep"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented. Reconsider if you really need this.")),(0,i.kt)("h3",{id:"create"},".create"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Consider ",(0,i.kt)("inlineCode",{parentName:"li"},"table.create")," instead.")),(0,i.kt)("h3",{id:"equals-1"},".equals"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.equals]"," will perform ",(0,i.kt)("strong",{parentName:"li"},"value-equality")," instead of ",(0,i.kt)("strong",{parentName:"li"},"reference-equality"),"."),(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.equals]"," only accepts two objects to compare between instead of varags arguments.")),(0,i.kt)("h3",{id:"equalsdeep-1"},".equalsDeep"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h3",{id:"find"},".find"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.find]"," accepts a predicate instead of a value."),(0,i.kt)("li",{parentName:"ul"},"Consider ",(0,i.kt)("inlineCode",{parentName:"li"},"table.find")," if you want to use a static value.")),(0,i.kt)("pre",null,(0,i.kt)("code",{parentName:"pre",className:"language-lua"},'-- Freeze\nFreeze.List.find(list, function(value)\n    return value == "foo"\nend)\n\n-- Llama\nLlama.List.find(list, "foo")\n')),(0,i.kt)("h3",{id:"findlast"},".findLast"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.findLast]"," accepts a predicate instead of a value.")),(0,i.kt)("pre",null,(0,i.kt)("code",{parentName:"pre",className:"language-lua"},'-- Freeze\nFreeze.List.findLast(list, function(value)\n    return value == "foo"\nend)\n\n-- Llama\nLlama.List.findLast(list, "foo")\n')),(0,i.kt)("h3",{id:"findwhere"},".findWhere"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Please use Freeze.","[List.find]","."),(0,i.kt)("li",{parentName:"ul"},"The ",(0,i.kt)("inlineCode",{parentName:"li"},"from")," argument is not supported.")),(0,i.kt)("h3",{id:"findwherelast"},".findWhereLast"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Please use Freeze.","[List.findLast]","."),(0,i.kt)("li",{parentName:"ul"},"The ",(0,i.kt)("inlineCode",{parentName:"li"},"from")," argument is not supported.")),(0,i.kt)("h3",{id:"insert"},".insert"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.insert]"," allows the provided ",(0,i.kt)("inlineCode",{parentName:"li"},"index")," argument to be out of bounds. Llama would throw in this case whereas Freeze will clamp the value to either the beginning or the end of the list.")),(0,i.kt)("h3",{id:"join"},".join"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Please use Freeze.","[List.concat]",".")),(0,i.kt)("h3",{id:"removeindices"},".removeIndices"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Please use Freeze.","[List.remove]"," instead.")),(0,i.kt)("h3",{id:"removevalues-1"},".removeValues"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"A temporary, deprecated compatibility layer exists. Please use Freeze.","[List.removeValue]"," instead.")),(0,i.kt)("h3",{id:"set"},".set"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.set]"," allows the ",(0,i.kt)("inlineCode",{parentName:"li"},"index")," argument to be out of bounds whereas Llama would throw."),(0,i.kt)("li",{parentName:"ul"},"If no changes are made, Freeze.","[List.set]"," will return the original List.")),(0,i.kt)("h3",{id:"slice"},".slice"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.slice]"," allows the ",(0,i.kt)("inlineCode",{parentName:"li"},"index")," argument to be out of bounds. Will not throw."),(0,i.kt)("li",{parentName:"ul"},"Using a negative number will slice from the end of the list.")),(0,i.kt)("h3",{id:"splice"},".splice"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h3",{id:"toset"},".toSet"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not exposed yet.")),(0,i.kt)("h3",{id:"update-1"},".update"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.update]"," requires an updater function while Llama's was optional."),(0,i.kt)("li",{parentName:"ul"},"Freeze","[List.update]","'s updater signature is ",(0,i.kt)("inlineCode",{parentName:"li"},"(Value) -> (Value)")," instead of Llama's ",(0,i.kt)("inlineCode",{parentName:"li"},"(Value, Key) -> (Value)"),"."),(0,i.kt)("li",{parentName:"ul"},"Freeze.","[List.update]"," final argument is ",(0,i.kt)("inlineCode",{parentName:"li"},"notSetValue")," instead of a ",(0,i.kt)("inlineCode",{parentName:"li"},"callback")," function.")),(0,i.kt)("pre",null,(0,i.kt)("code",{parentName:"pre",className:"language-lua"},'-- Freeze\nFreeze.List.update(list, key, function(value)\n    return string.upper(value)\nend, "default value")\n\n-- Llama\nLlama.List.update(list, key, function(value, key)\n    return string.upper(value)\nend, function(key)\n    return "default value"\nend)\n')),(0,i.kt)("h3",{id:"zipall"},".zipAll"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented.")),(0,i.kt)("h2",{id:"set-1"},"Set"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Not implemented yet.")))}m.isMDXComponent=!0}}]);