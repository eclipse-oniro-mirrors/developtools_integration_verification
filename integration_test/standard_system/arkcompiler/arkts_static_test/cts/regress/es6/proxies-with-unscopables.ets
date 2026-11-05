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
expected_out_1: "Semantic error ESE0301: Can't resolve array type"
---*/

function testBasics() {
  let log = [];

  let proxy = new Proxy({}, {
    get: function(target, key) {
      log.push('get ' + String(key));
      if (key === 'x') {
        return 1;
      }
    },
    has: function(target, key) {
      log.push('has ' + String(key));
      if (key === 'x') { return true; }
      return false;
    }
  });

  let x = 'local';

  with (proxy) {
    arktest.assertEQ(1, x);
  }

  arktest.assertEQ(['has assertEquals', 'has x', 'get Symbol(Symbol.unscopables)',
                'get x'], log);
}
testBasics();


function testInconsistent() {
  let log = [];

  let proxy = new Proxy({}, {
    get: function(target, key) {
      log.push('get ' + String(key));
      return undefined;
    },
    has: function(target, key) {
      log.push('has ' + String(key));
      if (key === 'x') { return true; }
      return false;
    }
  });

  let x = 'local';

  with (proxy) {
    arktest.assertEQ(void 0, x);
  }

  arktest.assertEQ(['has assertEquals', 'has x', 'get Symbol(Symbol.unscopables)',
                'get x'], log);
}
testInconsistent();


function testUseProxyAsUnscopables() {
  let x = 1;
  let object = {
    x: 2
  };
  let calls = 0;
  let proxy = new Proxy({}, {
    has: function() {
      arktest.assertTrue(false);
    },
    get: function(target, key) {
      arktest.assertEQ('x', key);
      calls++;
      return calls === 2 ? true : undefined;
    }
  });

  object[Symbol.unscopables] = proxy;

  with (object) {
    arktest.assertEQ(2, x);
    arktest.assertEQ(1, x);
  }

  // HasBinding, HasBinding
  arktest.assertEQ(2, calls);
}
testUseProxyAsUnscopables();


function testThrowInHasUnscopables() {
  let x = 1;
  let object = {
    x: 2
  };

  function CustomError() {}

  let calls = 0;
  let proxy = new Proxy({}, {
    has: function() {
      arktest.assertTrue(false);
    },
    get: function(target, key) {
      if (calls++ === 0) {
        throw new CustomError();
      }
      arktest.assertTrue(false);
    }
  });

  object[Symbol.unscopables] = proxy;

  arktest.expectThrow(function() {
    with (object) {
      x;
    }
  }, CustomError);
}
testThrowInHasUnscopables();


const global = this;
function testGlobalShouldIgnoreUnscopables() {
  global.x = 1;
  let proxy = new Proxy({}, {
    get: function() {
      arktest.assertTrue(false);
    },
    has: function() {
      arktest.assertTrue(false);
    }
  });
  global[Symbol.unscopables] = proxy;

  arktest.assertEQ(1, global.x);
  arktest.assertEQ(1, x);

  global.x = 2;
  arktest.assertEQ(2, global.x);
  arktest.assertEQ(2, x);

  x = 3;
  arktest.assertEQ(3, global.x);
  arktest.assertEQ(3, x);
}
testGlobalShouldIgnoreUnscopables();
