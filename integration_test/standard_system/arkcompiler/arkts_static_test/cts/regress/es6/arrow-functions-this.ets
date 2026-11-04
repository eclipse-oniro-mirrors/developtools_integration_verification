/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0202: 'this' cannot be referenced from a static context"
---*/

let targetObject: Object = {};
let global = this;
let call = Function.call.bind(Function.call);

let globalSloppyArrow = () => this;
let globalStrictArrow = () => { 'use strict'; return this; };
let globalSloppyArrowEval = (s) => eval(s);
let globalStrictArrowEval = (s) => { 'use strict'; return eval(s); };

let sloppyFunctionArrow = function() {
  return (() => this)();
};
let strictFunctionArrow = function() {
  'use strict';
  return (() => this)();
};
let sloppyFunctionEvalArrow = function() {
  return eval('(() => this)()');
};
let strictFunctionEvalArrow = function() {
  'use strict';
  return eval('(() => this)()');
};
let sloppyFunctionArrowEval = function(s) {
  return (() => eval(s))();
};
let strictFunctionArrowEval = function(s) {
  'use strict';
  return (() => eval(s))();
};

let withObject = { 'this': targetObject }
let arrowInsideWith;
let arrowInsideWithEval;
with (withObject) {
  arrowInsideWith = () => this;
  arrowInsideWithEval = (s) => eval(s);
}

arktest.assertEQ(global, call(globalSloppyArrow, targetObject));
arktest.assertEQ(global, call(globalStrictArrow, targetObject));
arktest.assertEQ(global, call(globalSloppyArrowEval, targetObject, 'this'));
arktest.assertEQ(global, call(globalStrictArrowEval, targetObject, 'this'));
arktest.assertEQ(global, call(globalSloppyArrowEval, targetObject, '(() => this)()'));
arktest.assertEQ(global, call(globalStrictArrowEval, targetObject, '(() => this)()'));

arktest.assertEQ(targetObject, call(sloppyFunctionArrow, targetObject));
arktest.assertEQ(global, call(sloppyFunctionArrow, undefined));
arktest.assertEQ(targetObject, call(strictFunctionArrow, targetObject));
arktest.assertEQ(undefined, call(strictFunctionArrow, undefined));

arktest.assertEQ(targetObject, call(sloppyFunctionEvalArrow, targetObject));
arktest.assertEQ(global, call(sloppyFunctionEvalArrow, undefined));
arktest.assertEQ(targetObject, call(strictFunctionEvalArrow, targetObject));
arktest.assertEQ(undefined, call(strictFunctionEvalArrow, undefined));

arktest.assertEQ(targetObject, call(sloppyFunctionArrowEval, targetObject, 'this'));
arktest.assertEQ(global, call(sloppyFunctionArrowEval, undefined, 'this'));
arktest.assertEQ(targetObject, call(strictFunctionArrowEval, targetObject, 'this'));
arktest.assertEQ(undefined, call(strictFunctionArrowEval, undefined, 'this'));

arktest.assertEQ(targetObject,
             call(sloppyFunctionArrowEval, targetObject, '(() => this)()'));
arktest.assertEQ(global,
             call(sloppyFunctionArrowEval, undefined, '(() => this)()'));
arktest.assertEQ(targetObject,
             call(strictFunctionArrowEval, targetObject, '(() => this)()'));
arktest.assertEQ(undefined,
             call(strictFunctionArrowEval, undefined, '(() => this)()'));

arktest.assertEQ(global, call(arrowInsideWith, undefined));
arktest.assertEQ(global, call(arrowInsideWith, targetObject));
arktest.assertEQ(global, call(arrowInsideWithEval, undefined, 'this'));
arktest.assertEQ(global, call(arrowInsideWithEval, targetObject, 'this'));
arktest.assertEQ(global, call(arrowInsideWithEval, undefined, '(() => this)()'));
arktest.assertEQ(global, call(arrowInsideWithEval, targetObject, '(() => this)()'));

(() => {
this.x = 0;

let p = {};
Object.defineProperty(p, 'x', {writable:false, value:5});
this.__proto__ = p;

function s(v) {
  v.x = 1;
}

function sStrict(v) {
  'use strict';
  v.x = 1;
}

function c(p) {
  return {__proto__: p};
}

let o1 = c(this);
let o2 = c(this);

s(c(this));
s(c(this));
sStrict(c(this));
sStrict(c(this));

delete this.x;

o1.x = 20;
arktest.assertEQ(5, o1.x);

s(o2);
arktest.assertEQ(5, o2.x);
})();

(() => {
this.__proto__ = null;
this.x = 10;
delete this.x;

function s(v) {
  return v.x = 1;
}

function sStrict(v) {
  'use strict';
  return v.x = 1;
}

function c() {
  const o = {__proto__:this};
  return o;
}

let o1 = c();
let o2 = c();
const o1Strict = c();
const o2Strict = c();
const o3 = c();
const o4 = c();

s(o1);
s(o2);
sStrict(o1Strict);
sStrict(o2Strict);

Object.defineProperty(this, 'x', {writable:false, configurable:true});

o3.x = 1;
arktest.assertEQ(undefined, o3.x);

s(o4);
arktest.assertEQ(undefined, o4.x);
})();
