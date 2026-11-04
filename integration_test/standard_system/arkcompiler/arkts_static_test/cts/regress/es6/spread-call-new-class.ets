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

(function testConstructClassStrict() {
  'use strict';
  class Base {
    constructor(...args) {
      this.baseArgs = args;
    }
    method() { return this.baseArgs; }
  }

  class Child extends Base {
    constructor(...args) {
      super(...args);
      this.childArgs = args;
    }
  }

  class Child2 extends Base {
    constructor(...args) {
      super('extra', ...args);
      this.childArgs = args;
    }
  }

  let c = new Base(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ([1, 2, 3], c.method());
  arktest.assertEQ([1, 2, 3], c.baseArgs);

  c = new Child(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ([1, 2, 3], c.method());
  arktest.assertEQ([1, 2, 3], c.baseArgs);
  arktest.assertEQ([1, 2, 3], c.childArgs);

  c = new Child2(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child2);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ(['extra', 1, 2, 3], c.method());
  arktest.assertEQ(['extra', 1, 2, 3], c.baseArgs);
  arktest.assertEQ([1, 2, 3], c.childArgs);
})();


(function testConstructSloppy() {
  class Base {
    constructor(...args) {
      this.baseArgs = args;
    }
    method() { return this.baseArgs; }
  }

  class Child extends Base {
    constructor(...args) {
      super(...args);
      this.childArgs = args;
    }
  }

  class Child2 extends Base {
    constructor(...args) {
      super('extra', ...args);
      this.childArgs = args;
    }
  }

  let c = new Base(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ([1, 2, 3], c.method());
  arktest.assertEQ([1, 2, 3], c.baseArgs);

  c = new Child(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ([1, 2, 3], c.method());
  arktest.assertEQ([1, 2, 3], c.baseArgs);
  arktest.assertEQ([1, 2, 3], c.childArgs);

  c = new Child2(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child2);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ(['extra', 1, 2, 3], c.method());
  arktest.assertEQ(['extra', 1, 2, 3], c.baseArgs);
  arktest.assertEQ([1, 2, 3], c.childArgs);
})();

(function testArgumentsObjectStrict() {
  'use strict';
  class Base {
    constructor(...args) {
      this.baseArgs = args;
    }
    method() { return this.baseArgs; }
  }

  class Child extends Base {
    constructor() {
      super(...arguments);
      this.childArgs = arguments;
    }
  }

  class Child2 extends Base {
    constructor() {
      super('extra', ...arguments);
      this.childArgs = arguments;
    }
  }

  let c = new Child(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ([1, 2, 3], c.method());
  arktest.assertEQ([1, 2, 3], c.baseArgs);
  arktest.assertFalse(Array.__proto__ === c.childArgs.__proto__);
  arktest.assertEQ([1, 2, 3], Array.prototype.slice.call(c.childArgs));

  c = new Child2(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child2);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ(['extra', 1, 2, 3], c.method());
  arktest.assertEQ(['extra', 1, 2, 3], c.baseArgs);
  arktest.assertFalse(Array.__proto__ === c.childArgs.__proto__);
  arktest.assertEQ([1, 2, 3], Array.prototype.slice.call(c.childArgs));
})();

(function testArgumentsObjectSloppy() {
  class Base {
    constructor(...args) {
      this.baseArgs = args;
    }
    method() { return this.baseArgs; }
  }

  class Child extends Base {
    constructor() {
      super(...arguments);
      this.childArgs = arguments;
    }
  }

  class Child2 extends Base {
    constructor() {
      super('extra', ...arguments);
      this.childArgs = arguments;
    }
  }

  let c = new Child(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ([1, 2, 3], c.method());
  arktest.assertEQ([1, 2, 3], c.baseArgs);
  arktest.assertFalse(Array.__proto__ === c.childArgs.__proto__);
  arktest.assertEQ([1, 2, 3], Array.prototype.slice.call(c.childArgs));

  c = new Child2(...[1, 2, 3]);
  arktest.assertTrue(c instanceof Child2);
  arktest.assertTrue(c instanceof Base);
  arktest.assertEQ(['extra', 1, 2, 3], c.method());
  arktest.assertEQ(['extra', 1, 2, 3], c.baseArgs);
  arktest.assertFalse(Array.__proto__ === c.childArgs.__proto__);
  arktest.assertEQ([1, 2, 3], Array.prototype.slice.call(c.childArgs));
})();
