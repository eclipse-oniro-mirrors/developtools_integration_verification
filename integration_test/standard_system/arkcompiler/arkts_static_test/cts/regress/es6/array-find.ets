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
expected_out_1: "Semantic error ESE0318: Type 'Int|undefined' cannot be assigned to type 'Int'"
---*/

const values: int[] = [21, 22, 23, 24];
const found: int = values.find((value: int): boolean => value > 100);

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of upstream project Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

const condition: boolean = Array.prototype.find.length === 1;
arktest.assertTrue(condition);

let a = [21, 22, 23, 24];
arktest.assertEQ(undefined, a.find(function() { return false; }));
arktest.assertEQ(21, a.find(function() { return true; }));
arktest.assertEQ(undefined, a.find(function(val) { return 121 === val; }));
arktest.assertEQ(24, a.find(function(val) { return 24 === val; }));
arktest.assertEQ(23, a.find(function(val) { return 23 === val; }), null);
arktest.assertEQ(22, a.find(function(val) { return 22 === val; }), undefined);


//
// Test predicate is not called when array is empty
//
(function() {
  let a = [];
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  a.find(function(val, key, obj) {
    o = obj;
    l = obj.length;
    v = val;
    k = key;

    return false;
  });

  arktest.assertEQ(-1, l);
  arktest.assertEQ(-1, o);
  arktest.assertEQ(-1, v);
  arktest.assertEQ(-1, k);
})();


//
// Test predicate is called with correct argumetns
//
(function() {
  let a = ['b'];
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  let found = a.find(function(val, key, obj) {
    o = obj;
    l = obj.length;
    v = val;
    k = key;

    return false;
  });

  arktest.assertEQ(a, o);
  arktest.assertEQ(a.length, l);
  arktest.assertEQ('b', v);
  arktest.assertEQ(0, k);
  arktest.assertEQ(undefined, found);
})();


//
// Test predicate is called array.length times
//
(function() {
  let a = [1, 2, 3, 4, 5];
  let l = 0;
  let found = a.find(function() {
    l++;
    return false;
  });

  arktest.assertEQ(a.length, l);
  arktest.assertEQ(undefined, found);
})();


//
// Test Array.prototype.find works with String
//
(function() {
  let a = 'abcd';
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;
  let found = Array.prototype.find.call(a, function(val, key, obj) {
    o = obj.toString();
    l = obj.length;
    v = val;
    k = key;

    return false;
  });

  arktest.assertEQ(a, o);
  arktest.assertEQ(a.length, l);
  arktest.assertEQ('d', v);
  arktest.assertEQ(3, k);
  arktest.assertEQ(undefined, found);

  found = Array.prototype.find.apply(a, [function(val, key, obj) {
    o = obj.toString();
    l = obj.length;
    v = val;
    k = key;

    return true;
  }]);

  arktest.assertEQ(a, o);
  arktest.assertEQ(a.length, l);
  arktest.assertEQ('a', v);
  arktest.assertEQ(0, k);
  arktest.assertEQ('a', found);
})();


//
// Test Array.prototype.find works with exotic object
//
(function() {
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;
  let a = {
    prop1: 'val1',
    prop2: 'val2',
    isValid: function() {
      return this.prop1 === 'val1' && this.prop2 === 'val2';
    }
  };

  Array.prototype.push.apply(a, [30, 31, 32]);
  let found = Array.prototype.find.call(a, function(val, key, obj) {
    o = obj;
    l = obj.length;
    v = val;
    k = key;

    return !obj.isValid();
  });

  arktest.assertEQ(a, o);
  arktest.assertEQ(3, l);
  arktest.assertEQ(32, v);
  arktest.assertEQ(2, k);
  arktest.assertEQ(undefined, found);
})();


//
// Test array modifications
//
(function() {
  let a = [1, 2, 3];
  let found = a.find(function(val) { a.push(val); return false; });
  arktest.assertEQ([1, 2, 3, 1, 2, 3], a);
  arktest.assertEQ(6, a.length);
  arktest.assertEQ(undefined, found);

  a = [1, 2, 3];
  found = a.find(function(val, key) { a[key] = ++val; return false; });
  arktest.assertEQ([2, 3, 4], a);
  arktest.assertEQ(3, a.length);
  arktest.assertEQ(undefined, found);
})();


//
// Test predicate is called for holes
//
(function() {
  let a = new Array(30);
  a[11] = 21;
  a[7] = 10;
  a[29] = 31;

  let count = 0;
  a.find(function() { count++; return false; });
  arktest.assertEQ(30, count);
})();


(function() {
  let a = [0, 1, , 3];
  let count = 0;
  let found = a.find(function(val) { return val === undefined; });
  arktest.assertEQ(undefined, found);
})();


(function() {
  let a = [0, 1, , 3];
  a.__proto__ = {
    __proto__: Array.prototype,
    2: 42,
  };
  let count = 0;
  let found = a.find(function(val) { return val === 42; });
  arktest.assertEQ(42, found);
})();


//
// Test predicate is called for missing properties
//
(function() {
  const obj = {
    '0': 0,
    '2': 2,
    length: 3
  };
  const received = [];
  const predicate = (v) => { received.push(v); return false; };
  const found = Array.prototype.find.call(obj, predicate);
  arktest.assertEQ(undefined, found);
  arktest.assertEQ([0, undefined, 2], received);
})();


//
// Test predicate modifying array prototype
//
(function() {
  const a = [0, , 2];
  const received = [];
  const predicate = (v) => {
    a.__proto__ = null;
    received.push(v);
    return false;
  };
  const found = Array.prototype.find.call(a, predicate);
  arktest.assertEQ(undefined, found);
  arktest.assertEQ([0, undefined, 2], received);
})();


//
// Test thisArg
//
(function() {
  // Test String as a thisArg
  let found = [1, 2, 3].find(function(val, key) {
    return this.charAt(Number(key)) === String(val);
  }, '321');
  arktest.assertEQ(2, found);

  // Test object as a thisArg
  const thisArg = {
    elementAt: function(key) {
      return this[key];
    }
  };
  Array.prototype.push.apply(thisArg, ['c', 'b', 'a']);

  found = ['a', 'b', 'c'].find(function(val, key) {
    return this.elementAt(key) === val;
  }, thisArg);
  arktest.assertEQ('b', found);

  // Create a new object in each function call when receiver is a
  // primitive value. See ECMA-262, Annex C.
  // Openharmony only support strict mode, this is "".
  a = [];
  [1, 2].find(function() { a.push(this) }, '');
  arktest.assertFalse(a[0] !== a[1]);

  // Do not create a new object otherwise.
  a = [];
  [1, 2].find(function() { a.push(this) }, {});
  arktest.assertEQ(a[0], a[1]);

  // In strict mode primitive values should not be coerced to an object.
  a = [];
  [1, 2].find(function() { 'use strict'; a.push(this); }, '');
  arktest.assertEQ('', a[0]);
  arktest.assertEQ(a[0], a[1]);

})();

// Test exceptions
arktest.expectThrow('Array.prototype.find.call(null, function() { })',
  TypeError);
arktest.expectThrow('Array.prototype.find.call(undefined, function() { })',
  TypeError);
arktest.expectThrow('Array.prototype.find.apply(null, function() { }, [])',
  TypeError);
arktest.expectThrow('Array.prototype.find.apply(undefined, function() { }, [])',
  TypeError);

arktest.expectThrow('[].find(null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find(undefined)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find(0)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find(true)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find(false)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find("")', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find({})', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find([])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].find(/\d+/)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('Array.prototype.find.call({}, null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, undefined)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, 0)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, true)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, false)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, "")', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, {})', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.call({}, /\d+/)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('Array.prototype.find.apply({}, null, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, undefined, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, 0, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, true, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, false, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, "", [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, {}, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, [], [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.find.apply({}, /\d+/, [])', ((e: Error): boolean => e instanceof TypeError));
