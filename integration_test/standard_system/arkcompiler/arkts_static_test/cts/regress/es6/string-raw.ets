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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function testStringRawArity() {
  arktest.assertEQ(1, String.raw.length);
})();


(function testStringRawCallSiteToObject() {
  arktest.expectThrow('String.raw()', ((e: Error): boolean => e instanceof TypeError));
})();


(function testStringRawCallSiteRawToObject() {
  arktest.expectThrow('String.raw([])', ((e: Error): boolean => e instanceof TypeError));
})();


(function testStringRawUndefinedLength() {
  let callSiteObj = [];
  callSiteObj.raw = {};
  arktest.assertEQ('', String.raw(callSiteObj));

  callSiteObj.raw = { lengt: 0 };
  arktest.assertEQ('', String.raw(callSiteObj));
})();


(function testStringRawZeroLength() {
  let callSiteObj = [];
  callSiteObj.raw = { length: 0 };
  arktest.assertEQ('', String.raw(callSiteObj));
  arktest.assertEQ('', String.raw(callSiteObj, 'a', 'b', 'c'));

  callSiteObj.raw = [];
  arktest.assertEQ('', String.raw(callSiteObj));
  arktest.assertEQ('', String.raw(callSiteObj, 'a', 'b', 'c'));
})();


(function testStringRawNegativeLength() {
  let callSiteObj = [];
  callSiteObj.raw = { length: -85 };
  arktest.assertEQ('', String.raw(callSiteObj));
  arktest.assertEQ('', String.raw(callSiteObj, 'a', 'b', 'c'));

  callSiteObj.raw = [];
  arktest.assertEQ('', String.raw(callSiteObj));
  arktest.assertEQ('', String.raw(callSiteObj, 'a', 'b', 'c'));
})();


(function testStringRawNaNLength() {
  let callSiteObj = [];
  callSiteObj.raw = { length: NaN };
  arktest.assertEQ('', String.raw(callSiteObj));
  arktest.assertEQ('', String.raw(callSiteObj, 'a', 'b', 'c'));

  callSiteObj.raw = [];
  arktest.assertEQ('', String.raw(callSiteObj));
  arktest.assertEQ('', String.raw(callSiteObj, 'a', 'b', 'c'));
})();


(function testStringRawBasic() {
  let callSiteObj = [];
  callSiteObj.raw = ['a'];
  arktest.assertEQ('a', String.raw(callSiteObj));
})();


(function testStringRawNoSubst() {
  let callSiteObj = [];
  callSiteObj.raw = ['a', 'b'];
  arktest.assertEQ('ab', String.raw(callSiteObj));
})();


(function testStringRawSubst() {
  let callSiteObj = [];
  callSiteObj.raw = ['a', 'b'];
  arktest.assertEQ('a!b', String.raw(callSiteObj, '!'));

  callSiteObj.raw = ['a', 'b', 'c'];
  arktest.assertEQ('abc', String.raw(callSiteObj));

  callSiteObj.raw = ['a', 'b', 'c'];
  arktest.assertEQ('a!bc', String.raw(callSiteObj, '!'));

  callSiteObj.raw = ['a', 'b', 'c'];
  arktest.assertEQ('a!b?c', String.raw(callSiteObj, '!', '?'));

  callSiteObj.raw = ['\n', '\r\n', '\r'];
  arktest.assertEQ('\nx\r\ny\r', String.raw(callSiteObj, 'x', 'y'));

  callSiteObj.raw = ['\n', '\r\n', '\r'];
  arktest.assertEQ('\n\r\r\r\n\n\r', String.raw(callSiteObj, '\r\r', '\n'));
})();


(function testStringRawArrayLikeSubst() {
  let callSiteObj = [];
  callSiteObj.raw = {'length': 2, '0': 'a', '1': 'b', '2': 'c'};
  arktest.assertEQ('axb', String.raw(callSiteObj, 'x', 'y'));

  callSiteObj.raw = {'length': 4, '0': 'a', '1': 'b', '2': 'c'};
  arktest.assertEQ('axbycundefined', String.raw(callSiteObj, 'x', 'y'));
})();


(function testStringRawAccessors() {
  let callSiteObj = {};
  callSiteObj.raw = {};
  Object.defineProperties(callSiteObj, {
    'length': {
      get: function() { arktest.assertTrue(false); },
      set: function(v) { arktest.assertTrue(false); }
    },
    '0': {
      get: function() { arktest.assertTrue(false); },
      set: function(v) { arktest.assertTrue(false); }
    },
    '1': {
      get: function() { arktest.assertTrue(false); },
      set: function(v) { arktest.assertTrue(false); }
    }
  });
  Object.defineProperties(callSiteObj.raw, {
    'length': {
      get: function() { return 2; },
      set: function(v) { arktest.assertTrue(false); }
    },
    '0': {
      get: function() { return 'getter values'; },
      set: function(v) { arktest.assertTrue(false); }
    },
    '1': {
      get: function() { return 'are nice'; },
      set: function(v) { arktest.assertTrue(false); }
    }
  });
  arktest.assertEQ('getter values are nice', String.raw(callSiteObj, ' '));
})();


(function testStringRawHoleyArray() {
  let callSiteObj = [];
  callSiteObj.raw = ['1.'];
  callSiteObj.raw[2] = '.2';
  arktest.assertEQ('1.undefined.2', String.raw(callSiteObj));
})();


(function testStringRawAccessorThrows() {
  let callSiteObj = [];
  callSiteObj.raw = [1];
  function MyError() {}
  Object.defineProperty(callSiteObj.raw, '0', {
    get: function() { throw new MyError(); }
  });
  arktest.expectThrow(function() { String.raw(callSiteObj); }, MyError);
})();


(function testStringRawToStringSafe() {
  let callSiteObj = [];
  callSiteObj.raw = [null, undefined, 1, 'str', true, false, NaN, Infinity, {}];
  arktest.assertEQ('nullundefined1strtruefalseNaNInfinity[object Object]',
               String.raw(callSiteObj));

  callSiteObj.raw = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  arktest.assertEQ('0null1undefined213str4true5false6NaN7Infinity8[object Object]9',
               String.raw(callSiteObj, null, void 0, 1, 'str', true, false,
               NaN, Infinity, {}));
})();


(function testStringRawToStringSymbolThrows() {
  let callSiteObj = [];
  callSiteObj.raw = [Symbol('foo')];
  arktest.expectThrow(function() {
    String.raw(callSiteObj);
  }, ((e: Error): boolean => e instanceof TypeError));

  callSiteObj.raw = ['1', '2'];
  arktest.expectThrow(function() {
    String.raw(callSiteObj, Symbol('foo'));
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testStringRawToStringThrows() {
  let callSiteObj = [];
  let thrower = {};
  function MyError() {}
  thrower.toString = function() {
    throw new MyError();
  }

  callSiteObj.raw = [thrower];
  arktest.expectThrow(function() {
    String.raw(callSiteObj);
  }, MyError);

  callSiteObj.raw = ['1', '2'];
  arktest.expectThrow(function() {
    String.raw(callSiteObj, thrower);
  }, MyError);
})();


(function testStringRawToStringValueOfThrows() {
  let callSiteObj = [];
  let thrower = {};
  function MyError() {}
  thrower.toString = null;
  thrower.valueOf = function() {
    throw new MyError();
  }

  callSiteObj.raw = [thrower];
  arktest.expectThrow(function() {
    String.raw(callSiteObj);
  }, MyError);

  callSiteObj.raw = ['1', '2'];
  arktest.expectThrow(function() {
    String.raw(callSiteObj, thrower);
  }, MyError);
})();


(function testStringRawOrder() {
  const order = [];
  let callSiteObj = [];
  callSiteObj.raw = {};
  function arg(v) {
    const result = {};
    result.toString = null;
    result.valueOf = function() { order.push('arg' + v); return v; }
    return result;
  }

  Object.defineProperty(callSiteObj.raw, 'length', {
    get: function() { order.push('length'); return 3; }
  });
  [1, 3, 5].forEach(function(v, i) {
    Object.defineProperty(callSiteObj.raw, i, {
      get: function() { order.push('raw' + v); return v; }
    });
  });

  arktest.assertEQ('12345', String.raw(callSiteObj, arg(2), arg(4), arg(6)));
  arktest.assertEQ(['length', 'raw1', 'arg2', 'raw3', 'arg4', 'raw5'], order);
})();


(function testStringRawToStringSubstitutionsOrder() {
  const subs = [];
  const log = [];
  function stringify(toString) {
    const valueOf = '_' + toString + '_';
    return {
      toString: function() { return toString; },
      valueOf: function() { return valueOf; }
    };
  }
  function getter(name, value) {
    return {
      get: function() {
        log.push('get' + name);
        return value;
      },
      set: function(v) {
        log.push('set' + name);
      }
    };
  }
  Object.defineProperties(subs, {
    0: getter(0, stringify('a')),
    1: getter(1, stringify('b')),
    2: getter(2, stringify('c'))
  });

  arktest.assertEQ('-a-b-c-', String.raw`-${subs[0]}-${subs[1]}-${subs[2]}-`);
  arktest.assertEQ(['get0', 'get1', 'get2'], log);

  log.length = 0;
  arktest.assertEQ('-a-', String.raw`-${subs[0]}-`);
  arktest.assertEQ(['get0'], log);
})();
