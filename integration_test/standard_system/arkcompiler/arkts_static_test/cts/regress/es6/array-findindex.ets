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
expected_out_1: "Semantic error ESE0318: Type 'Int' cannot be assigned to type 'String'"
---*/

let index: string = [1].findIndex((v: int): boolean => v > 3);

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

const condition: boolean = Array.prototype.findIndex.length === 1;
arktest.assertTrue(condition);

let a = [21, 22, 23, 24];
arktest.assertEQ(-1, a.findIndex(function() { return false; }));
arktest.assertEQ(-1, a.findIndex(function(val) { return 121 === val; }));
arktest.assertEQ(0, a.findIndex(function() { return true; }));
arktest.assertEQ(1, a.findIndex(function(val) { return 22 === val; }), undefined);
arktest.assertEQ(2, a.findIndex(function(val) { return 23 === val; }), null);
arktest.assertEQ(3, a.findIndex(function(val) { return 24 === val; }));


//
// Test predicate is not called when array is empty
//
(function() {
  let a = [];
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  a.findIndex(function(val, key, obj) {
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

  let index = a.findIndex(function(val, key, obj) {
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
  arktest.assertEQ(-1, index);
})();


//
// Test predicate is called array.length times
//
(function() {
  let a = [1, 2, 3, 4, 5];
  let l = 0;

  a.findIndex(function() {
    l++;
    return false;
  });

  arktest.assertEQ(a.length, l);
})();


//
// Test Array.prototype.findIndex works with String
//
(function() {
  let a = 'abcd';
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  let index = Array.prototype.findIndex.call(a, function(val, key, obj) {
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
  arktest.assertEQ(-1, index);

  index = Array.prototype.findIndex.apply(a, [function(val, key, obj) {
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
  arktest.assertEQ(0, index);
})();


//
// Test Array.prototype.findIndex works with exotic object
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

  let index = Array.prototype.findIndex.call(a, function(val, key, obj) {
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
  arktest.assertEQ(-1, index);
})();


//
// Test array modifications
//
(function() {
  let a = [1, 2, 3];
  a.findIndex(function(val) { a.push(val); return false; });
  arktest.assertEQ([1, 2, 3, 1, 2, 3], a);
  arktest.assertEQ(6, a.length);

  a = [1, 2, 3];
  a.findIndex(function(val, key) { a[key] = ++val; return false; });
  arktest.assertEQ([2, 3, 4], a);
  arktest.assertEQ(3, a.length);
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
  a.findIndex(function() { count++; return false; });
  arktest.assertEQ(30, count);
})();


(function() {
  let a = [0, 1, , 3];
  let count = 0;
  let index = a.findIndex(function(val) { return val === undefined; });
  arktest.assertEQ(2, index);
})();


(function() {
  let a = [0, 1, , 3];
  a.__proto__ = {
    __proto__: Array.prototype,
    2: 42,
  };
  let count = 0;
  let index = a.findIndex(function(val) { return val === 42; });
  arktest.assertEQ(2, index);
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
  const found = Array.prototype.findIndex.call(obj, predicate);
  arktest.assertEQ(-1, found);
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
  const found = Array.prototype.findIndex.call(a, predicate);
  arktest.assertEQ(-1, found);
  arktest.assertEQ([0, undefined, 2], received);
})();


//
// Test thisArg
//
(function() {
  // Test String as a thisArg
  let index = [1, 2, 3].findIndex(function(val, key) {
    return this.charAt(Number(key)) === String(val);
  }, '321');
  arktest.assertEQ(1, index);

  // Test object as a thisArg
  const thisArg = {
    elementAt: function(key) {
      return this[key];
    }
  };
  Array.prototype.push.apply(thisArg, ['c', 'b', 'a']);

  index = ['a', 'b', 'c'].findIndex(function(val, key) {
    return this.elementAt(key) === val;
  }, thisArg);
  arktest.assertEQ(1, index);

  // Create a new object in each function call when receiver is a
  // primitive value. See ECMA-262, Annex C.
  a = [];
  // Openharmony only support strict mode, a = ["", ""]
  [1, 2].findIndex(function() { a.push(this) }, '');
  arktest.assertFalse(a[0] !== a[1]);

  // Do not create a new object otherwise.
  a = [];
  [1, 2].findIndex(function() { a.push(this) }, {});
  arktest.assertEQ(a[0], a[1]);

  // In strict mode primitive values should not be coerced to an object.
  a = [];
  [1, 2].findIndex(function() { 'use strict'; a.push(this); }, '');
  arktest.assertEQ('', a[0]);
  arktest.assertEQ(a[0], a[1]);

})();

// Test exceptions
arktest.expectThrow('Array.prototype.findIndex.call(null, function() { })',
  TypeError);
arktest.expectThrow('Array.prototype.findIndex.call(undefined, function() { })',
  TypeError);
arktest.expectThrow('Array.prototype.findIndex.apply(null, function() { }, [])',
  TypeError);
arktest.expectThrow('Array.prototype.findIndex.apply(undefined, function() { }, [])',
  TypeError);

arktest.expectThrow('[].findIndex(null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex(undefined)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex(0)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex(true)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex(false)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex("")', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex({})', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex([])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('[].findIndex(/\d+/)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('Array.prototype.findIndex.call({}, null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, undefined)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, 0)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, true)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, false)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, "")', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, {})', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.call({}, /\d+/)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('Array.prototype.findIndex.apply({}, null, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, undefined, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, 0, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, true, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, false, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, "", [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, {}, [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, [], [])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.findIndex.apply({}, /\d+/, [])', ((e: Error): boolean => e instanceof TypeError));
