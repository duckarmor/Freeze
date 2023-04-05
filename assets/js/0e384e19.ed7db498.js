"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[671],{3905:(e,t,r)=>{r.d(t,{Zo:()=>u,kt:()=>d});var a=r(7294);function n(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function l(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,a)}return r}function o(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?l(Object(r),!0).forEach((function(t){n(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):l(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function i(e,t){if(null==e)return{};var r,a,n=function(e,t){if(null==e)return{};var r,a,n={},l=Object.keys(e);for(a=0;a<l.length;a++)r=l[a],t.indexOf(r)>=0||(n[r]=e[r]);return n}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(a=0;a<l.length;a++)r=l[a],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(n[r]=e[r])}return n}var s=a.createContext({}),p=function(e){var t=a.useContext(s),r=t;return e&&(r="function"==typeof e?e(t):o(o({},t),e)),r},u=function(e){var t=p(e.components);return a.createElement(s.Provider,{value:t},e.children)},c="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},f=a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,l=e.originalType,s=e.parentName,u=i(e,["components","mdxType","originalType","parentName"]),c=p(r),f=n,d=c["".concat(s,".").concat(f)]||c[f]||m[f]||l;return r?a.createElement(d,o(o({ref:t},u),{},{components:r})):a.createElement(d,o({ref:t},u))}));function d(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var l=r.length,o=new Array(l);o[0]=f;var i={};for(var s in t)hasOwnProperty.call(t,s)&&(i[s]=t[s]);i.originalType=e,i[c]="string"==typeof e?e:n,o[1]=i;for(var p=2;p<l;p++)o[p]=r[p];return a.createElement.apply(null,o)}return a.createElement.apply(null,r)}f.displayName="MDXCreateElement"},9881:(e,t,r)=>{r.r(t),r.d(t,{assets:()=>s,contentTitle:()=>o,default:()=>m,frontMatter:()=>l,metadata:()=>i,toc:()=>p});var a=r(7462),n=(r(7294),r(3905));const l={sidebar_position:1},o="Freeze",i={unversionedId:"intro",id:"intro",title:"Freeze",description:"Freeze is an immutable data structure library for Roblox Luau.",source:"@site/docs/intro.md",sourceDirName:".",slug:"/intro",permalink:"/Freeze/docs/intro",draft:!1,editUrl:"https://github.com/benbrimeyer/Freeze/edit/master/docs/intro.md",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"defaultSidebar",next:{title:"How does immutability help?",permalink:"/Freeze/docs/WhyImmutable"}},s={},p=[{value:"Freeze&#39;s General Philosophy",id:"freezes-general-philosophy",level:2},{value:"Prior art",id:"prior-art",level:2}],u={toc:p},c="wrapper";function m(e){let{components:t,...r}=e;return(0,n.kt)(c,(0,a.Z)({},u,r,{components:t,mdxType:"MDXLayout"}),(0,n.kt)("h1",{id:"freeze"},"Freeze"),(0,n.kt)("p",null,"Freeze is an immutable data structure library for Roblox Luau."),(0,n.kt)("p",null,"Immutable data structures are imperative for use with popular libraries such as React and Rodux. To learn more about why immutability is important, check out our ",(0,n.kt)("strong",{parentName:"p"},"How does immutability help?")," page."),(0,n.kt)("p",null,"Freeze is fully",(0,n.kt)("sup",{parentName:"p",id:"fnref-1"},(0,n.kt)("a",{parentName:"sup",href:"#fn-1",className:"footnote-ref"},"1"))," typed and currently used in several duckarmor projects."),(0,n.kt)("p",null,"Use Freeze to create immutable data structures like so:"),(0,n.kt)("pre",null,(0,n.kt)("code",{parentName:"pre",className:"language-lua"},'local map1 = { a = 1, b = 2, c = 3 }\nlocal map2 = Freeze.Dictionary.set(map1, "b", 50)\n\nprint(map1.b, "vs", map2.b)\n-- 2 vs 50\n')),(0,n.kt)("p",null,"Freeze will optimize return calls in such that it will return the original list or dictionary if no changes were made:"),(0,n.kt)("pre",null,(0,n.kt)("code",{parentName:"pre",className:"language-lua"},'local map1 = { a = 1 }\nlocal map2 = Freeze.Dictionary.set(map1, "a", 1)\n\nprint(map1 == map2)\n-- true; because no changes were made\n')),(0,n.kt)("p",null,"True to it's name, Freeze will return calls of new values wrapped in ",(0,n.kt)("inlineCode",{parentName:"p"},"table.frozen"),". Return values that are not changed will not be ",(0,n.kt)("inlineCode",{parentName:"p"},"table.frozen"),"'d to preserve the caller's frozen status."),(0,n.kt)("h2",{id:"freezes-general-philosophy"},"Freeze's General Philosophy"),(0,n.kt)("p",null,"Freeze aims to"),(0,n.kt)("ul",null,(0,n.kt)("li",{parentName:"ul"},"Be type safe. Types are represented in such that there are no false negative type errors."),(0,n.kt)("li",{parentName:"ul"},"Be runtime safe. Errors will not propagate unless you are passing invalid values that the Luau type checker would have caught."),(0,n.kt)("li",{parentName:"ul"},"Enforce immutability via ",(0,n.kt)("inlineCode",{parentName:"li"},"table.frozen")),(0,n.kt)("li",{parentName:"ul"},"Optimize return values if no changes were made within the operation by returning the original value.")),(0,n.kt)("h2",{id:"prior-art"},"Prior art"),(0,n.kt)("p",null,"Freeze takes inspiration from:"),(0,n.kt)("ul",null,(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("a",{parentName:"li",href:"https://github.com/freddylist/llama"},"Llama by freddylist")),(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("a",{parentName:"li",href:"https://immutable-js.com/"},"Immutable.js"))),(0,n.kt)("div",{className:"footnotes"},(0,n.kt)("hr",{parentName:"div"}),(0,n.kt)("ol",{parentName:"div"},(0,n.kt)("li",{parentName:"ol",id:"fn-1"},"To the best of Luau's and my own ability.",(0,n.kt)("a",{parentName:"li",href:"#fnref-1",className:"footnote-backref"},"\u21a9")))))}m.isMDXComponent=!0}}]);