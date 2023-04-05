"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[331],{3905:(e,t,r)=>{r.d(t,{Zo:()=>s,kt:()=>f});var a=r(7294);function n(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function l(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,a)}return r}function o(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?l(Object(r),!0).forEach((function(t){n(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):l(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function i(e,t){if(null==e)return{};var r,a,n=function(e,t){if(null==e)return{};var r,a,n={},l=Object.keys(e);for(a=0;a<l.length;a++)r=l[a],t.indexOf(r)>=0||(n[r]=e[r]);return n}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(a=0;a<l.length;a++)r=l[a],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(n[r]=e[r])}return n}var p=a.createContext({}),u=function(e){var t=a.useContext(p),r=t;return e&&(r="function"==typeof e?e(t):o(o({},t),e)),r},s=function(e){var t=u(e.components);return a.createElement(p.Provider,{value:t},e.children)},c="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},d=a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,l=e.originalType,p=e.parentName,s=i(e,["components","mdxType","originalType","parentName"]),c=u(r),d=n,f=c["".concat(p,".").concat(d)]||c[d]||m[d]||l;return r?a.createElement(f,o(o({ref:t},s),{},{components:r})):a.createElement(f,o({ref:t},s))}));function f(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var l=r.length,o=new Array(l);o[0]=d;var i={};for(var p in t)hasOwnProperty.call(t,p)&&(i[p]=t[p]);i.originalType=e,i[c]="string"==typeof e?e:n,o[1]=i;for(var u=2;u<l;u++)o[u]=r[u];return a.createElement.apply(null,o)}return a.createElement.apply(null,r)}d.displayName="MDXCreateElement"},4948:(e,t,r)=>{r.r(t),r.d(t,{contentTitle:()=>o,default:()=>c,frontMatter:()=>l,metadata:()=>i,toc:()=>p});var a=r(7462),n=(r(7294),r(3905));const l={},o="Freeze",i={type:"mdx",permalink:"/Freeze/",source:"@site/pages/index.md",title:"Freeze",description:"Freeze is an immutable data structure library for Roblox Luau.",frontMatter:{}},p=[{value:"Freeze&#39;s General Philosophy",id:"freezes-general-philosophy",level:2},{value:"Prior art",id:"prior-art",level:2},{value:"Demos",id:"demos",level:2}],u={toc:p},s="wrapper";function c(e){let{components:t,...r}=e;return(0,n.kt)(s,(0,a.Z)({},u,r,{components:t,mdxType:"MDXLayout"}),(0,n.kt)("h1",{id:"freeze"},"Freeze"),(0,n.kt)("p",null,"Freeze is an immutable data structure library for Roblox Luau."),(0,n.kt)("p",null,"Immutable data structures are imperative for use with popular libraries such as React and Rodux. To learn more about why immutability is important, check out our ",(0,n.kt)("strong",{parentName:"p"},"How does immutability help?")," page."),(0,n.kt)("p",null,"Freeze is typed and currently used in several duckarmor projects."),(0,n.kt)("p",null,"Use Freeze to create immutable data structures like so:"),(0,n.kt)("pre",null,(0,n.kt)("code",{parentName:"pre",className:"language-lua"},'local map1 = { a = 1, b = 2, c = 3 }\nlocal map2 = Freeze.Dictionary.set(map1, "b", 50)\n\nprint(map1.b, "vs", map2.b)\n-- 2 vs 50\n')),(0,n.kt)("p",null,"Freeze will optimize return calls in such that it will return the original list or dictionary if no changes were made:"),(0,n.kt)("pre",null,(0,n.kt)("code",{parentName:"pre",className:"language-lua"},'local map1 = { a = 1 }\nlocal map2 = Freeze.Dictionary.set(map1, "a", 1)\n\nprint(map1 == map2)\n-- true; because no changes were made\n')),(0,n.kt)("p",null,"True to it's name, Freeze will return calls of new values wrapped in ",(0,n.kt)("inlineCode",{parentName:"p"},"table.frozen"),". Return values that are not changed will not be ",(0,n.kt)("inlineCode",{parentName:"p"},"table.frozen"),"'d to preserve the caller's frozen status."),(0,n.kt)("h2",{id:"freezes-general-philosophy"},"Freeze's General Philosophy"),(0,n.kt)("p",null,"Freeze aims to"),(0,n.kt)("ul",null,(0,n.kt)("li",{parentName:"ul"},"Be type safe. Types are represented in such that there are no false negative type errors."),(0,n.kt)("li",{parentName:"ul"},"Be runtime safe. Errors will not propagate unless you are passing invalid values that the Luau type checker would have caught."),(0,n.kt)("li",{parentName:"ul"},"Enforce immutability via ",(0,n.kt)("inlineCode",{parentName:"li"},"table.frozen")),(0,n.kt)("li",{parentName:"ul"},"Optimize return values if no changes were made within the operation by returning the original value.")),(0,n.kt)("h2",{id:"prior-art"},"Prior art"),(0,n.kt)("p",null,"Freeze takes inspiration from:"),(0,n.kt)("ul",null,(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("a",{parentName:"li",href:"https://github.com/freddylist/llama"},"Llama by freddylist")),(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("a",{parentName:"li",href:"https://immutable-js.com/"},"Immutable.js"))),(0,n.kt)("h2",{id:"demos"},"Demos"),(0,n.kt)("p",null,"See ",(0,n.kt)("a",{parentName:"p",href:"https://benbrimeyer.github.io/Freeze/docs/Demonstration"},"demonstrations")," within our docs!"))}c.isMDXComponent=!0}}]);