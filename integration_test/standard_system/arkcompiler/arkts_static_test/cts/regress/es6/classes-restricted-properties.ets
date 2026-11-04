/*
 * Copyright (C) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

(function TestThisAccessRestriction() {
  class Base {}
  (function() {
    class C extends Base {
      constructor() {
        let y;
        super();
      }
    }; new C();
  }());
  arktest.expectThrow(function() {
    class C extends Base {
      constructor() {
        super(this.x);
      }
    }; new C();
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C extends Base {
      constructor() {
        super(this);
      }
    }; new C();
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C extends Base {
      constructor() {
        super.method();
        super(this);
      }
    }; new C();
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C extends Base {
      constructor() {
        super(super.method());
      }
    }; new C();
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C extends Base {
      constructor() {
        super(super());
      }
    }; new C();
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C extends Base {
      constructor() {
        super(1, 2, Object.getPrototypeOf(this));
      }
    }; new C();
  }, ((e: Error): boolean => e instanceof ReferenceError));
  (function() {
    class C extends Base {
      constructor() {
        { super(1, 2); }
      }
    }; new C();
  }());
  (function() {
    class C extends Base {
      constructor() {
        if (1) { super(); }
      }
    }; new C();
  }());

  class C1 extends Object {
    constructor() {
      'use strict';
      super();
    }
  };
  new C1();

  class C2 extends Object {
    constructor() {
      ; 'use strict';;;;;
      super();
    }
  };
  new C2();

  class C3 extends Object {
    constructor() {
      ; 'use strict';;;;;
      super();
    }
  };
  new C3();
}());


(function testRestrictedPropertiesStrict() {
  'use strict';
  class ClassWithDefaultConstructor {
    method() {}
  }
  class Class {
    constructor() {}
    method() {}
  }
  class DerivedClassWithDefaultConstructor extends Class {}
  class DerivedClass extends Class { constructor() { super(); } }
})();


(function testRestrictedPropertiesSloppy() {
  class ClassWithDefaultConstructor {
    method() {}
  }
  class Class {
    constructor() {}
    method() {}
  }
  class DerivedClassWithDefaultConstructor extends Class {}
  class DerivedClass extends Class { constructor() { super(); } }
})();
