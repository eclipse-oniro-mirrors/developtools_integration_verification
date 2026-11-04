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
expected_out_1: "Semantic error ESE0143: Unresolved reference Symbol"
---*/

let key = Symbol.toStringTag;


const global = this;

const funs = {
  Object:   [ Object ],
  Function: [ Function ],
  String:   [ String ],
  Boolean:  [ Boolean ],
  Number:   [ Number ],
  Date:     [ Date ],
  RegExp:   [ RegExp ],
  Error:    [ Error, TypeError, RangeError, SyntaxError, ReferenceError,
              EvalError, URIError ]
}
for (let f in funs) {
  for (let i in funs[f]) {
    arktest.assertEQ('[object ' + f + ']',
                 Array.prototype.toString.call(new funs[f][i]),
                 funs[f][i]);
    arktest.assertEQ('[object Function]',
                 Array.prototype.toString.call(funs[f][i]),
                 funs[f][i]);
  }
}


function testToStringTag(className) {
  // Using builtin toStringTags
  let obj = {};
  obj[Symbol.toStringTag] = className;
  arktest.assertEQ('[object ' + className + ']',
               Array.prototype.toString.call(obj));

  // Getter throws
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { throw className; }
  });
  arktest.expectThrow(function() {
    Array.prototype.toString.call(obj);
  }, className);

  // Getter does not throw
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return className; }
  });
  arktest.assertEQ('[object ' + className + ']',
               Array.prototype.toString.call(obj));

  // Custom, non-builtin toStringTags
  obj = {};
  obj[Symbol.toStringTag] = 'X' + className;
  arktest.assertEQ('[object X' + className + ']',
               Array.prototype.toString.call(obj));

  // With getter
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return 'X' + className; }
  });
  arktest.assertEQ('[object X' + className + ']',
               Array.prototype.toString.call(obj));

  // Undefined toStringTag should return [object className]
  let obj = className === 'Arguments' ?
      (function() { return arguments; })() : new global[className];
  obj[Symbol.toStringTag] = undefined;
  arktest.assertEQ('[object ' + className + ']',
               Array.prototype.toString.call(obj));

  // With getter
  let obj = className === 'Arguments' ?
      (function() { return arguments; })() : new global[className];
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return undefined; }
  });
  arktest.assertEQ('[object ' + className + ']',
               Array.prototype.toString.call(obj));
}


[
  'Arguments',
  'Boolean',
  'Date',
  'Error',
  'Function',
  'Number',
  'RegExp',
  'String'
].forEach(testToStringTag);


function testToStringTagNonString(value) {
  let obj = {};
  obj[Symbol.toStringTag] = value;
  arktest.assertEQ('[object Object]', Array.prototype.toString.call(obj));

  // With getter
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return value; }
  });
  arktest.assertEQ('[object Object]', Array.prototype.toString.call(obj));
}


[
  null,
  function() {},
  [],
  {},
  /regexp/,
  42,
  Symbol('sym'),
  new Date(),
  (function() { return arguments; })(),
  true,
  new Error('oops'),
  Object('str')
].forEach(testToStringTagNonString);


function testArrayToStringPropertyDesc() {
  const desc = Object.getOwnPropertyDescriptor(Object.prototype, 'toString');
  arktest.assertTrue(desc.writable);
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
}
testArrayToStringPropertyDesc();


function testArrayToStringOwnNonStringValue() {
  let obj = Object.defineProperty({}, Symbol.toStringTag, { value: 1 });
  arktest.assertEQ('[object Object]', ([]).toString.call(obj));
}
testArrayToStringOwnNonStringValue();


function testArrayToStringBasic() {
  arktest.assertEQ('1,2,3', [1,2,3].toString());
  arktest.assertEQ(',,3', [,,3].toString());
}
testArrayToStringBasic();


function testArrayToStringObjectWithCallableJoin() {
  let obj = { join: function() { return 'CallableJoin'; } };
  arktest.assertEQ('CallableJoin', Array.prototype.toString.call(obj));
}
testArrayToStringObjectWithCallableJoin();
