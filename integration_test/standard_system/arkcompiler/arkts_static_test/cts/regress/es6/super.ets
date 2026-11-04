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

(function TestSuperNamedLoads() {
  function Base() { }
  function fBase() { }
  Base.prototype = {
    f() {
      return 'Base ' + this.toString();
    },
    x: 15,
    toString() {
      return 'this is Base';
    }
  };

  function Derived() {
    this.derivedDataProperty = 'xxx';
  }
  Derived.prototype = {
    __proto__: Base.prototype,
    toString() { return 'this is Derived'; },
    x: 27,
    f() {
      arktest.assertEQ('Base this is Derived', super.f());
      let a = super.x;
      arktest.assertEQ(15, a);
      arktest.assertEQ(15, super.x);
      arktest.assertEQ(27, this.x);
      return 'Derived';
    }
  };

  arktest.assertEQ('Base this is Base', new Base().f());
  arktest.assertEQ('Derived', new Derived().f());
}());


(function TestSuperKeyedLoads() {
  'use strict';

  let x = 'x';
  const derivedDataProperty = 'derivedDataProperty';
  let f = 'f';

  class Base {
    f() {
      return 'Base ' + this.toString();
    }
    toString() {
      return 'this is Base';
    }
  }

  Base.prototype[x] = 15;

  function Derived() {
    this[derivedDataProperty] = 'xxx';
  }
  Derived.prototype = {
    __proto__: Base.prototype,
    toString() { return 'this is Derived'; },
    x: 27,
    f() {
      arktest.assertEQ('Base this is Derived', super[f]());
      let a = super[x];
      arktest.assertEQ(15, a);
      arktest.assertEQ(15, super[x]);
      arktest.assertEQ(27, this[x]);
      return 'Derived';
    }
  };

  arktest.assertEQ('Base this is Base', new Base().f());
  arktest.assertEQ('Derived', new Derived().f());
}());


(function TestSuperKeywordNonMethod() {
  'use strict';

  class C {
    f() {
      super.unknown();
    }
  }

  arktest.expectThrow(function() {
    new C().f();
  }, ((e: Error): boolean => e instanceof TypeError));
}());


(function TestGetter() {
  function Base() {}
  let derived;
  Base.prototype = {
    constructor: Base,
    get x() {
      arktest.assertEQ(this, derived);
      return this._x;
    },
    _x: 'base'
  };

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 'derived',
    testGetter() {
      return super.x;
    },
    testGetterStrict() {
      'use strict';
      return super.x;
    }
  };

  derived = new Derived();
  arktest.assertEQ('derived', derived.testGetter());
  derived = new Derived();
  arktest.assertEQ('derived', derived.testGetterStrict());
}());


(function TestGetterKeyed() {
  let x = 'x';
  function Base() {}
  let derived;
  Base.prototype = {
    constructor: Base,
    get x() {
      arktest.assertEQ(this, derived);
      return this._x;
    },
    _x: 'base'
  };

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 'derived',
    testGetter() {
      return super[x];
    },
    testGetterStrict() {
      'use strict';
      return super[x];
    },
    testGetterWithToString() {
      let toStringCalled;
      let o = { toString: function() {
        toStringCalled++;
        return 'x';
      } };

      toStringCalled = 0;
      arktest.assertEQ('derived', super[o]);
      arktest.assertEQ(1, toStringCalled);

      let eToThrow = new Error();
      let oThrowsInToString = { toString: function() {
        throw eToThrow;
      } };

      let ex = null;
      try {
        super[oThrowsInToString];
      } catch(e) { ex = e }
      arktest.assertEQ(eToThrow, ex);

      let oReturnsNumericString = { toString: function() {
        return '1';
      } };

      arktest.assertEQ(undefined, super[oReturnsNumericString]);
      arktest.assertEQ(undefined, super[1]);
    }
  };

  derived = new Derived();
  arktest.assertEQ('derived', derived.testGetter());
  derived = new Derived();
  arktest.assertEQ('derived', derived.testGetterStrict());
  derived = new Derived();
  derived.testGetterWithToString();
}());


(function TestGetterNumericKeyed() {
  let x = 42;
  function Base() {}
  let derived;
  Base.prototype = {
    constructor: Base,
    _x: 'base'
  };

  Object.defineProperty(Base.prototype, x, { get: function() {
      arktest.assertEQ(this, derived);
      return this._x;
  }});

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 'derived',
    testGetter() {
      return super[x];
    },
    testGetterStrict() {
      'use strict';
      return super[x];
    },
    testGetterWithToString() {
      let toStringCalled;
      let o = {
        toString: function() {
          toStringCalled++;
          return '42';
        }
      };

      toStringCalled = 0;
      arktest.assertEQ('derived', super[o]);
      arktest.assertEQ(1, toStringCalled);

      let eToThrow = new Error();
      let oThrowsInToString = {
        toString: function() {
          throw eToThrow;
        }
      };

      let ex = null;
      try {
        super[oThrowsInToString];
      } catch(e) { ex = e }
      arktest.assertEQ(eToThrow, ex);

      let oReturnsNumericString = {
        toString: function() {
          return '42';
        }
      };

      arktest.assertEQ('derived', super[oReturnsNumericString]);
      arktest.assertEQ('derived', super[42]);
    }
  };

  derived = new Derived();
  arktest.assertEQ('derived', derived.testGetter());
  derived = new Derived();
  arktest.assertEQ('derived', derived.testGetterStrict());
  derived = new Derived();
  derived.testGetterWithToString();
}());


(function TestSetter() {
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      return this._x;
    },
    set x(v) {
      this._x = v;
    },
    _x: 'base'
  };

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 'derived',
    testSetter() {
      arktest.assertEQ('foobar', super.x = 'foobar');
      arktest.assertEQ('foobarabc', super.x += 'abc');
    },
    testSetterStrict() {
      'use strict';
      arktest.assertEQ('foobar', super.x = 'foobar');
      arktest.assertEQ('foobarabc', super.x += 'abc');
    }
  };

  let d = new Derived();
  d.testSetter();
  arktest.assertEQ('base', Base.prototype._x);
  arktest.assertEQ('foobarabc', d._x);
  d._x = '';

  d.testSetterStrict();
  arktest.assertEQ('base', Base.prototype._x);
  arktest.assertEQ('foobarabc', d._x);
}());


(function TestSetterNumericKeyed() {
  let x = 42;
  function Base() {}
  Base.prototype = {
    constructor: Base,
    _x: 'base'
  };

  Object.defineProperty(Base.prototype, x,
    { get: function() { return this._x; },
      set: function(v) { this._x = v; }
    });

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 'derived',
    testSetter() {
      arktest.assertEQ('foobar', super[x] = 'foobar');
      arktest.assertEQ('foobarabc', super[x] += 'abc');
    },
    testSetterStrict() {
      'use strict';
      arktest.assertEQ('foobar', super[x] = 'foobar');
      arktest.assertEQ('foobarabc', super[x] += 'abc');
    },
    testSetterWithToString() {
      let toStringCalled;
      let o = {
        toString: function() {
          toStringCalled++;
          return x;
        }
      };

      toStringCalled = 0;
      super[o] = 'set';
      arktest.assertEQ(1, toStringCalled);
      arktest.assertEQ('set', this._x);

      let eToThrow = new Error();
      let oThrowsInToString = {
        toString: function() {
          throw eToThrow;
        }
      };

      let ex = null;
      try {
        super[oThrowsInToString] = 'xyz';
      } catch(e) { ex = e }
      arktest.assertEQ(eToThrow, ex);
      arktest.assertEQ('set', this._x);
    }
  };

  let d = new Derived();
  d.testSetter();
  arktest.assertEQ('base', Base.prototype._x);
  arktest.assertEQ('foobarabc', d._x);
  d._x = '';

  d.testSetterStrict();
  arktest.assertEQ('base', Base.prototype._x);
  arktest.assertEQ('foobarabc', d._x);

  d = new Derived();
  d.testSetterWithToString();
}());


(function TestSetterKeyed() {
  let x = 'x';
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      return this._x;
    },
    set x(v) {
      this._x = v;
    },
    _x: 'base'
  };

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 'derived',
    testSetter() {
      arktest.assertEQ('foobar', super[x] = 'foobar');
      arktest.assertEQ('foobarabc', super[x] += 'abc');
    },
    testSetterStrict() {
      'use strict';
      arktest.assertEQ('foobar', super[x] = 'foobar');
      arktest.assertEQ('foobarabc', super[x] += 'abc');
    },
    testSetterWithToString() {
      let toStringCalled;
      let o = {
        toString: function() {
          toStringCalled++;
          return 'x';
        }
      };

      toStringCalled = 0;
      super[o] = 'set';
      arktest.assertEQ(1, toStringCalled);
      arktest.assertEQ('set', this._x);

      let eToThrow = new Error();
      let oThrowsInToString = {
        toString: function() {
          throw eToThrow;
        }
      };

      let ex = null;
      try {
        super[oThrowsInToString] = 'xyz';
      } catch(e) { ex = e }
      arktest.assertEQ(eToThrow, ex);
      arktest.assertEQ('set', this._x);

      let oReturnsNumericString = {
        toString: function() {
          return '1';
        }
      };

      arktest.assertEQ('abc', super[oReturnsNumericString] = 'abc');

      arktest.assertEQ('set', this._x);

      arktest.assertEQ(10,  super[1] = 10);
    }
  };

  let d = new Derived();
  d.testSetter();
  arktest.assertEQ('base', Base.prototype._x);
  arktest.assertEQ('foobarabc', d._x);
  d._x = '';
  d.testSetterStrict();
  arktest.assertEQ('base', Base.prototype._x);
  arktest.assertEQ('foobarabc', d._x);

  d = new Derived();
  d.testSetterWithToString();
}());


(function TestSetterDataProperties() {
  function Base() {}
  Base.prototype = {
    constructor: Base,
    x: 'x from Base'
  };

  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testSetter() {
      arktest.assertEQ('x from Base', super.x);
      super.x = 'data property';
      arktest.assertEQ('x from Base', super.x);
      arktest.assertEQ('data property', this.x);
    }
  };

  new Derived().testSetter();
}());


(function TestKeyedSetterDataProperties() {
  let x = 'x';
  function Base() {}
  Base.prototype = {
    constructor: Base,
    x: 'x from Base'
  };

  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testSetter() {
      arktest.assertEQ('x from Base', super[x]);
      super[x] = 'data property';
      arktest.assertEQ('x from Base', super[x]);
      arktest.assertEQ('data property', this[x]);
    }
  };

  new Derived().testSetter();
}());


(function TestKeyedNumericSetterDataProperties() {
  let x = 42;
  function Base() {}
  Base.prototype = {
    constructor: Base,
    42: 'x from Base'
  };

  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testSetter() {
      arktest.assertEQ('x from Base', super[x]);
      super[x] = 'data property';
      arktest.assertEQ('x from Base', super[x]);
      arktest.assertEQ('data property', this[x]);
    }
  };

  new Derived().testSetter();
}());


(function TestAccessorsOnPrimitives() {
  let getCalled = 0;
  let setCalled = 0;
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      getCalled++;
      return 1;
    },
    set x(v) {
      setCalled++;
      return v;
    },
  };

  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testSetter() {
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ('object', typeof this);
      arktest.assertTrue(this instanceof Number)
      arktest.assertEQ(42, this.valueOf());
      arktest.assertEQ(1, super.x);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      arktest.assertEQ(5, super.x = 5);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(1, setCalled);

      arktest.assertEQ(6, super.x += 5);
      arktest.assertEQ(2, getCalled);
      arktest.assertEQ(2, setCalled);

      super.newProperty = 15;
      arktest.assertEQ(15, this.newProperty);
      arktest.assertEQ(undefined, super.newProperty);
    },
    testSetterStrict() {
      'use strict';
      getCalled = 0;
      setCalled = 0;
      arktest.assertTrue(42 === this);

      arktest.assertEQ(1, super.x);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      arktest.assertEQ(5, super.x = 5);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(1, setCalled);

      arktest.assertEQ(6, super.x += 5);
      arktest.assertEQ(2, getCalled);
      arktest.assertEQ(2, setCalled);

      let ex;
      try {
        super.newProperty = 15;
      } catch (e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
    }
  }

  Derived.prototype.testSetter.call(42);
  Derived.prototype.testSetterStrict.call(42);

  function derivedFromString() {}
  derivedFromString.prototype = {
    __proto__: String.prototype,
    f() {
      'use strict';
      arktest.assertTrue(42 === this);
      arktest.assertEQ(String.prototype.toString, super.toString);
      let ex;
      try {
        super.toString();
      } catch(e) { ex = e; }

      arktest.assertTrue(ex instanceof TypeError);
    }
  };

  derivedFromString.prototype.f.call(42);
}());


(function TestKeyedAccessorsOnPrimitives() {
  let x = 'x';
  let newProperty = 'newProperty';
  let toString = 'toString';
  let getCalled = 0;
  let setCalled = 0;
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      getCalled++;
      return 1;
    },
    set x(v) {
      setCalled++;
      return v;
    },
  };

  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testSetter() {
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ('object', typeof this);
      arktest.assertTrue(this instanceof Number)
      arktest.assertEQ(42, this.valueOf());
      arktest.assertEQ(1, super[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      arktest.assertEQ(5, super[x] = 5);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(1, setCalled);

      arktest.assertEQ(6, super[x] += 5);
      arktest.assertEQ(2, getCalled);
      arktest.assertEQ(2, setCalled);

      super[newProperty] = 15;
      arktest.assertEQ(15, this[newProperty]);
      arktest.assertEQ(undefined, super[newProperty]);
    },
    testSetterStrict() {
      'use strict';
      getCalled = 0;
      setCalled = 0;
      arktest.assertTrue(42 === this);

      arktest.assertEQ(1, super[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      arktest.assertEQ(5, super[x] = 5);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(1, setCalled);

      arktest.assertEQ(6, super[x] += 5);
      arktest.assertEQ(2, getCalled);
      arktest.assertEQ(2, setCalled);

      let ex;
      try {
        super[newProperty] = 15;
      } catch (e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
    }
  };

  Derived.prototype.testSetter.call(42);
  Derived.prototype.testSetterStrict.call(42);

  function derivedFromString() {}
  derivedFromString.prototype = {
    __proto__: String.prototype,
    f() {
      'use strict';
      arktest.assertTrue(42 === this);
      arktest.assertEQ(String.prototype.toString, super[toString]);
      let ex;
      try {
        super[toString]();
      } catch(e) { ex = e; }

      arktest.assertTrue(ex instanceof TypeError);
    }
  };
  derivedFromString.prototype.f.call(42);
}());


(function TestNumericKeyedAccessorsOnPrimitives() {
  let x = 42;
  let newProperty = 43;
  let getCalled = 0;
  let setCalled = 0;
  function Base() {}
  Base.prototype = {
    constructor: Base,
  };

  Object.defineProperty(Base.prototype, x, {
    get: function() {
      getCalled++;
      return 1;
    },
    set: function(v) {
      setCalled++;
      return v;
    }
  });

  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testSetter() {
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ('object', typeof this);
      arktest.assertTrue(this instanceof Number)
      arktest.assertEQ(42, this.valueOf());
      arktest.assertEQ(1, super[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      arktest.assertEQ(5, super[x] = 5);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(1, setCalled);

      arktest.assertEQ(6, super[x] += 5);
      arktest.assertEQ(2, getCalled);
      arktest.assertEQ(2, setCalled);

      super[newProperty] = 15;
      arktest.assertEQ(15, this[newProperty]);
      arktest.assertEQ(undefined, super[newProperty]);
    },
    testSetterStrict() {
      'use strict';
      getCalled = 0;
      setCalled = 0;
      arktest.assertTrue(42 === this);

      arktest.assertEQ(1, super[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      arktest.assertEQ(5, super[x] = 5);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(1, setCalled);

      arktest.assertEQ(6, super[x] += 5);
      arktest.assertEQ(2, getCalled);
      arktest.assertEQ(2, setCalled);

      let ex;
      try {
        super[newProperty] = 15;
      } catch (e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
    }
  };

  Derived.prototype.testSetter.call(42);
  Derived.prototype.testSetterStrict.call(42);
}());


(function TestKeyedNumericSetterOnExotics() {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    callSetterOnArray() {
      super[42] = 1;
    },
    callStrictSetterOnString() {
      'use strict';
      arktest.assertEQ('string', typeof this);
      arktest.assertTrue('abcdef' === this);
      let ex = null;
      try {
        super[5] = 'q';
      } catch(e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);

      ex = null;
      try {
        super[1024] = 'q';
      } catch(e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
    }
  };

  let x = [];
  arktest.assertEQ(0, x.length);
  Derived.prototype.callSetterOnArray.call(x);
  arktest.assertEQ(43, x.length);
  arktest.assertEQ(1, x[42]);

  const s = 'abcdef';
  Derived.prototype.callStrictSetterOnString.call(s)
}());


(function TestSetterUndefinedProperties() {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(undefined, super.x);
      arktest.assertEQ(undefined, this.x);
      super.x = 10;
      arktest.assertEQ(10, this.x);
      arktest.assertEQ(undefined, super.x);
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(undefined, super.x);
      arktest.assertEQ(undefined, this.x);
      super.x = 10;
      arktest.assertEQ(10, this.x);
      arktest.assertEQ(undefined, super.x);
    }
  };

  let d = new Derived();
  d.mSloppy();
  arktest.assertEQ(10, d.x);
  let d1 = new Derived();
  d1.mStrict();
  arktest.assertEQ(10, d.x);
}());


(function TestKeyedSetterUndefinedProperties() {
  let x = 'x';
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(undefined, super[x]);
      arktest.assertEQ(undefined, this[x]);
      super[x] = 10;
      arktest.assertEQ(10, this[x]);
      arktest.assertEQ(undefined, super[x]);
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(undefined, super[x]);
      arktest.assertEQ(undefined, this[x]);
      super[x] = 10;
      arktest.assertEQ(10, this[x]);
      arktest.assertEQ(undefined, super[x]);
    }
  };
  let d = new Derived();
  d.mSloppy();
  arktest.assertEQ(10, d.x);
  let d1 = new Derived();
  d1.mStrict();
  arktest.assertEQ(10, d.x);
}());


(function TestKeyedNumericSetterUndefinedProperties() {
  let x = 42;
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(undefined, super[x]);
      arktest.assertEQ(undefined, this[x]);
      super[x] = 10;
      arktest.assertEQ(10, this[x]);
      arktest.assertEQ(undefined, super[x]);
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(undefined, super[x]);
      arktest.assertEQ(undefined, this[x]);
      super[x] = 10;
      arktest.assertEQ(10, this[x]);
      arktest.assertEQ(undefined, super[x]);
    }
  };
  let d = new Derived();
  d.mSloppy();
  arktest.assertEQ(10, d[x]);
  let d1 = new Derived();
  d1.mStrict();
  arktest.assertEQ(10, d[x]);
}());


(function TestSetterCreatingOwnPropertiesReconfigurable() {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(42, this.ownReadOnly);
      super.ownReadOnly = 55;
      arktest.assertEQ(undefined, super.ownReadOnly);
      arktest.assertEQ(42, this.ownReadOnly);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownReadOnly'));

      arktest.assertEQ(15, this.ownReadonlyAccessor);
      super.ownReadonlyAccessor = 25;
      arktest.assertEQ(undefined, super.ownReadonlyAccessor);
      arktest.assertEQ(15, this.ownReadonlyAccessor);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownReadonlyAccessor'));

      super.ownSetter = 35;
      arktest.assertEQ(undefined, super.ownSetter);
      let descr = Object.getOwnPropertyDescriptor(this, 'ownSetter');
      arktest.assertTrue('set' in descr);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownSetter'));
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(42, this.ownReadOnly);
      arktest.expectThrow(() => {super.ownReadOnly = 55}, ((e: Error): boolean => e instanceof TypeError));
      arktest.assertEQ(undefined, super.ownReadOnly);
      arktest.assertEQ(42, this.ownReadOnly);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownReadOnly'));

      arktest.assertEQ(15, this.ownReadonlyAccessor);
      arktest.expectThrow(() => {super.ownReadonlyAccessor = 25}, ((e: Error): boolean => e instanceof TypeError));
      arktest.assertEQ(undefined, super.ownReadonlyAccessor);
      arktest.assertEQ(15, this.ownReadonlyAccessor);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownReadonlyAccessor'));

      arktest.expectThrow(() => {super.ownSetter = 35}, ((e: Error): boolean => e instanceof TypeError));
      arktest.assertEQ(undefined, super.ownSetter);
      let descr = Object.getOwnPropertyDescriptor(this, 'ownSetter');
      arktest.assertTrue('set' in descr);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownSetter'));
    },
  };

  let d = new Derived();
  Object.defineProperty(d, 'ownReadOnly', {
    value: 42,
    writable: false,
    configurable: true
  });
  Object.defineProperty(d, 'ownSetter', {
    set: function() { arktest.assertTrue(false); },
    configurable: true
  });
  Object.defineProperty(d, 'ownReadonlyAccessor', {
    get: function() { return 15; },
    configurable: true
  });

  d.mSloppy();

  let d = new Derived();
  Object.defineProperty(d, 'ownReadOnly', {
    value: 42,
    writable: false,
    configurable: true
  });
  Object.defineProperty(d, 'ownSetter', {
    set: function() { arktest.assertTrue(false); },
    configurable: true
  });
  Object.defineProperty(d, 'ownReadonlyAccessor', {
    get: function() { return 15; },
    configurable: true
  });
  d.mStrict();
}());


(function TestSetterCreatingOwnPropertiesNonConfigurable() {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(42, this.ownReadOnly);
      super.ownReadOnly = 55;
      arktest.assertEQ(42, this.ownReadOnly);
      let descr = Object.getOwnPropertyDescriptor(this, 'ownReadOnly');
      arktest.assertEQ(42, descr.value);
      arktest.assertFalse(descr.configurable);
      arktest.assertFalse(descr.enumerable);
      arktest.assertFalse(descr.writable);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownReadOnly'));

      arktest.assertEQ(15, this.ownReadonlyAccessor);
      super.ownReadonlyAccessor = 25;
      arktest.assertEQ(undefined, super.ownReadonlyAccessor);
      arktest.assertEQ(15, this.ownReadonlyAccessor);
      let descr = Object.getOwnPropertyDescriptor(this, 'ownReadonlyAccessor');
      arktest.assertFalse(descr.configurable);
      arktest.assertFalse(descr.enumerable);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownReadonlyAccessor'));

      super.ownSetter = 35;
      let descr = Object.getOwnPropertyDescriptor(this, 'ownSetter');
      arktest.assertFalse(descr.configurable);
      arktest.assertFalse(descr.enumerable);
      arktest.assertFalse(Base.prototype.hasOwnProperty('ownSetter'));
    },
    mStrict() {
      'use strict';
      let ex;
      arktest.assertEQ(42, this.ownReadOnly);
      try {
        super.ownReadOnly = 55;
      } catch (e) {
        ex = e;
      }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ(
          'Cannot assign to read only property \'ownReadOnly\' of object \'#<Base>\'',
          ex.message);
      arktest.assertEQ(42, this.ownReadOnly);

      ex = null;
      arktest.assertEQ(15, this.ownReadonlyAccessor);
      try {
        super.ownReadonlyAccessor = 25;
      } catch (e) {
        ex = e;
      }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ('Cannot redefine property: ownReadonlyAccessor', ex.message);
      arktest.assertEQ(15, this.ownReadonlyAccessor);

      ex = null;
      try {
        super.ownSetter = 35;
      } catch (e) {
        ex = e;
      }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ('Cannot redefine property: ownSetter', ex.message);
    }
  };

  let d = new Derived();
  Object.defineProperty(d, 'ownReadOnly', { value : 42, writable : false });
  Object.defineProperty(d, 'ownSetter',
      { set : function() { arktest.assertTrue(false); } });
  Object.defineProperty(d, 'ownReadonlyAccessor',
      { get : function() { return 15; }});
  d.mSloppy();
  d.mStrict();
}());


(function TestSetterInForIn() {
  let setCalled = 0;
  let getCalled = 0;
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      getCalled++;
      return 1;
    },
    set x(v) {
      setCalled++;
      this.x_.push(v);
    },
  };

  function Derived() {
    this.x_ = [];
  }
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    testIter() {
      setCalled = 0;
      getCalled = 0;
      for (super.x in [1,2,3]) {}
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(3, setCalled);
      arktest.assertEQ(['0', '1', '2'], this.x_);
    },
    testIterKeyed() {
      setCalled = 0;
      getCalled = 0;
      for (super[x] in [1,2,3]) {}
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(3, setCalled);
      arktest.assertEQ(['0','1','2'], this.x_);

      this.x_ = [];
      setCalled = 0;
      getCalled = 0;
      let toStringCalled = 0;
      let o = {toString: function () { toStringCalled++; return x }};
      for (super[o] in [1,2,3]) {}
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(3, setCalled);
      arktest.assertEQ(3, toStringCalled);
      arktest.assertEQ(['0','1','2'], this.x_);
    }
  };

  new Derived().testIter();

  let x = 'x';

  new Derived().testIterKeyed();
}());


function testKeyedSetterCreatingOwnPropertiesReconfigurable(ownReadOnly,
    ownReadonlyAccessor, ownSetter) {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(42, this[ownReadOnly]);
      super[ownReadOnly] = 55;
      arktest.assertEQ(undefined, super[ownReadOnly]);
      arktest.assertEQ(42, this[ownReadOnly]);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownReadOnly));

      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      super[ownReadonlyAccessor] = 25;
      arktest.assertEQ(undefined, super[ownReadonlyAccessor]);
      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownReadonlyAccessor));

      super[ownSetter] = 35;
      arktest.assertEQ(undefined, super[ownSetter]);
      let descr = Object.getOwnPropertyDescriptor(this, ownSetter);
      arktest.assertTrue('set' in descr);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownSetter));
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(42, this[ownReadOnly]);
      arktest.expectThrow(() => {super[ownReadOnly] = 55}, ((e: Error): boolean => e instanceof TypeError));
      arktest.assertEQ(undefined, super[ownReadOnly]);
      arktest.assertEQ(42, this[ownReadOnly]);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownReadOnly));

      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      arktest.expectThrow(() => {super[ownReadonlyAccessor] = 25}, ((e: Error): boolean => e instanceof TypeError));
      arktest.assertEQ(undefined, super[ownReadonlyAccessor]);
      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownReadonlyAccessor));

      arktest.expectThrow(() => {super[ownSetter] = 35}, ((e: Error): boolean => e instanceof TypeError));
      arktest.assertEQ(undefined, super[ownSetter]);
      let descr = Object.getOwnPropertyDescriptor(this, ownSetter);
      arktest.assertTrue('set' in descr);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownSetter));
    },
  };

  let d = new Derived();
  Object.defineProperty(d, ownReadOnly, {
    value: 42,
    writable: false,
    configurable: true
  });
  Object.defineProperty(d, ownSetter, {
    set: function() { arktest.assertTrue(false); },
    configurable: true
  });
  Object.defineProperty(d, ownReadonlyAccessor, {
    get: function() { return 15; },
    configurable: true
  });

  d.mSloppy();

  let d = new Derived();
  Object.defineProperty(d, ownReadOnly, {
    value: 42,
    writable: false,
    configurable: true
  });
  Object.defineProperty(d, ownSetter, {
    set: function() { arktest.assertTrue(false); },
    configurable: true
  });
  Object.defineProperty(d, ownReadonlyAccessor, {
    get: function() { return 15; },
    configurable: true
  });
  d.mStrict();
}
testKeyedSetterCreatingOwnPropertiesReconfigurable('ownReadOnly',
                                                   'ownReadonlyAccessor',
                                                   'ownSetter');
testKeyedSetterCreatingOwnPropertiesReconfigurable(42, 43, 44);


function testKeyedSetterCreatingOwnPropertiesNonConfigurable(
    ownReadOnly, ownReadonlyAccessor, ownSetter) {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      arktest.assertEQ(42, this[ownReadOnly]);
      super[ownReadOnly] = 55;
      arktest.assertEQ(42, this[ownReadOnly]);
      let descr = Object.getOwnPropertyDescriptor(this, ownReadOnly);
      arktest.assertEQ(42, descr.value);
      arktest.assertFalse(descr.configurable);
      arktest.assertFalse(descr.enumerable);
      arktest.assertFalse(descr.writable);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownReadOnly));

      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      super[ownReadonlyAccessor] = 25;
      arktest.assertEQ(undefined, super[ownReadonlyAccessor]);
      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      let descr = Object.getOwnPropertyDescriptor(this, ownReadonlyAccessor);
      arktest.assertFalse(descr.configurable);
      arktest.assertFalse(descr.enumerable);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownReadonlyAccessor));

      super[ownSetter] = 35;
      let descr = Object.getOwnPropertyDescriptor(this, ownSetter);
      arktest.assertFalse(descr.configurable);
      arktest.assertFalse(descr.enumerable);
      arktest.assertFalse(Base.prototype.hasOwnProperty(ownSetter));
    },
    mStrict() {
      'use strict';
      let ex;
      arktest.assertEQ(42, this[ownReadOnly]);
      try {
        super[ownReadOnly] = 55;
      } catch (e) {
        ex = e;
      }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ(
          'Cannot assign to read only property \'' + ownReadOnly +
              '\' of object \'#<Base>\'',
          ex.message);
      arktest.assertEQ(42, this[ownReadOnly]);

      ex = null;
      arktest.assertEQ(15, this[ownReadonlyAccessor]);
      try {
        super[ownReadonlyAccessor] = 25;
      } catch (e) {
        ex = e;
      }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ('Cannot redefine property: ' + ownReadonlyAccessor,
                   ex.message);
      arktest.assertEQ(15, this[ownReadonlyAccessor]);

      ex = null;
      try {
        super[ownSetter] = 35;
      } catch (e) {
        ex = e;
      }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ('Cannot redefine property: ' + ownSetter, ex.message);
    }
  };

  let d = new Derived();
  Object.defineProperty(d, ownReadOnly, { value : 42, writable : false });
  Object.defineProperty(d, ownSetter,
      { set : function() { arktest.assertTrue(false); } });
  Object.defineProperty(d, ownReadonlyAccessor,
      { get : function() { return 15; }});
  d.mSloppy();
  d.mStrict();
}
testKeyedSetterCreatingOwnPropertiesNonConfigurable('ownReadOnly',
    'ownReadonlyAccessor', 'ownSetter');
testKeyedSetterCreatingOwnPropertiesNonConfigurable(42, 43, 44);


(function TestSetterNoProtoWalk() {
  function Base() {}
  function Derived() {}
  let getCalled;
  let setCalled;
  Derived.prototype = {
    __proto__: Base.prototype,
    get x() { getCalled++; return 42; },
    set x(v) { setCalled++; },
    mSloppy() {
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ(42, this.x);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      getCalled = 0;
      setCalled = 0;
      this.x = 43;
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(1, setCalled);

      getCalled = 0;
      setCalled = 0;
      super.x = 15;
      arktest.assertEQ(0, setCalled);
      arktest.assertEQ(0, getCalled);

      arktest.assertEQ(15, this.x);
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(0, setCalled);
    },
    mStrict() {
      'use strict';
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ(42, this.x);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      getCalled = 0;
      setCalled = 0;
      this.x = 43;
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(1, setCalled);

      getCalled = 0;
      setCalled = 0;
      super.x = 15;
      arktest.assertEQ(0, setCalled);
      arktest.assertEQ(0, getCalled);

      arktest.assertEQ(15, this.x);
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(0, setCalled);
    }
  };

  new Derived().mSloppy();
  new Derived().mStrict();
}());


(function TestKeyedSetterNoProtoWalk() {
  let x = 'x';
  function Base() {}
  function Derived() {}
  let getCalled;
  let setCalled;
  Derived.prototype = {
    __proto__: Base.prototype,
    get x() { getCalled++; return 42; },
    set x(v) { setCalled++; },
    mSloppy() {
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ(42, this[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      getCalled = 0;
      setCalled = 0;
      this[x] = 43;
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(1, setCalled);

      getCalled = 0;
      setCalled = 0;
      super[x] = 15;
      arktest.assertEQ(0, setCalled);
      arktest.assertEQ(0, getCalled);

      arktest.assertEQ(15, this[x]);
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(0, setCalled);
    },
    mStrict() {
      'use strict';
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ(42, this[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      getCalled = 0;
      setCalled = 0;
      this[x] = 43;
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(1, setCalled);

      getCalled = 0;
      setCalled = 0;
      super[x] = 15;
      arktest.assertEQ(0, setCalled);
      arktest.assertEQ(0, getCalled);

      arktest.assertEQ(15, this[x]);
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(0, setCalled);
    }
  };

  new Derived().mSloppy();
  new Derived().mStrict();
}());


(function TestKeyedNumericSetterNoProtoWalk() {
  let x = 42;
  function Base() {}
  function Derived() {}
  let getCalled;
  let setCalled;
  Derived.prototype = {
    __proto__: Base.prototype,
    mSloppy() {
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ(42, this[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      getCalled = 0;
      setCalled = 0;
      this[x] = 43;
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(1, setCalled);

      getCalled = 0;
      setCalled = 0;
      super[x] = 15;
      arktest.assertEQ(0, setCalled);
      arktest.assertEQ(0, getCalled);

      arktest.assertEQ(15, this[x]);
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(0, setCalled);
    },
    mStrict() {
      'use strict';
      setCalled = 0;
      getCalled = 0;
      arktest.assertEQ(42, this[x]);
      arktest.assertEQ(1, getCalled);
      arktest.assertEQ(0, setCalled);

      getCalled = 0;
      setCalled = 0;
      this[x] = 43;
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(1, setCalled);

      getCalled = 0;
      setCalled = 0;
      super[x] = 15;
      arktest.assertEQ(0, setCalled);
      arktest.assertEQ(0, getCalled);

      arktest.assertEQ(15, this[x]);
      arktest.assertEQ(0, getCalled);
      arktest.assertEQ(0, setCalled);
    }
  };

  Object.defineProperty(Derived.prototype, x, {
    get: function() { getCalled++; return 42; },
    set: function(v) { setCalled++; }
  });

  new Derived().mSloppy();
  new Derived().mStrict();
}());


(function TestSetterDoesNotReconfigure() {
  function Base() {}
  function Derived() {}
  Derived.prototype = {
    __proto__: Derived.prototype,
    mStrict(){
      'use strict';
      super.nonEnumConfig = 5;
      let d1 = Object.getOwnPropertyDescriptor(this, 'nonEnumConfig');
      arktest.assertEQ(5, d1.value);
      arktest.assertTrue(d1.configurable);
      arktest.assertFalse(d1.enumerable);

      super.nonEnumNonConfig = 5;
      let d1 = Object.getOwnPropertyDescriptor(this, 'nonEnumNonConfig');
      arktest.assertEQ(5, d1.value);
      arktest.assertFalse(d1.configurable);
      arktest.assertFalse(d1.enumerable);
    },
    mSloppy(){
      super.nonEnumConfig = 42;
      let d1 = Object.getOwnPropertyDescriptor(this, 'nonEnumConfig');
      arktest.assertEQ(42, d1.value);
      arktest.assertTrue(d1.configurable);
      arktest.assertFalse(d1.enumerable);

      super.nonEnumNonConfig = 42;
      let d1 = Object.getOwnPropertyDescriptor(this, 'nonEnumNonConfig');
      arktest.assertEQ(42, d1.value);
      arktest.assertFalse(d1.configurable);
      arktest.assertFalse(d1.enumerable);
    }
  };

  let d = new Derived();
  Object.defineProperty(d, 'nonEnumConfig',
      { value : 0, enumerable : false, configurable : true, writable : true });
  Object.defineProperty(d, 'nonEnumNonConfig',
      { value : 0, enumerable : false, configurable : false, writable : true });
  d.mStrict();
  d.mSloppy();
}());


(function TestKeyedSetterDoesNotReconfigure() {
  let nonEnumConfig = 'nonEnumConfig';
  let nonEnumNonConfig = 'nonEnumNonConfig';
  function Base() {}
  function Derived() {}

  Derived.prototype = {
    __proto__: Base.prototype,
    mStrict(){
      'use strict';
      super[nonEnumConfig] = 5;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumConfig);
      arktest.assertEQ(5, d1.value);
      arktest.assertTrue(d1.configurable);
      arktest.assertFalse(d1.enumerable);

      super[nonEnumNonConfig] = 5;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumNonConfig);
      arktest.assertEQ(5, d1.value);
      arktest.assertFalse(d1.configurable);
      arktest.assertFalse(d1.enumerable);
    },
    mSloppy(){
      super[nonEnumConfig] = 42;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumConfig);
      arktest.assertEQ(42, d1.value);
      arktest.assertTrue(d1.configurable);
      arktest.assertFalse(d1.enumerable);

      super[nonEnumNonConfig] = 42;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumNonConfig);
      arktest.assertEQ(42, d1.value);
      arktest.assertFalse(d1.configurable);
      arktest.assertFalse(d1.enumerable);
    }
  };

  let d = new Derived();
  Object.defineProperty(d, nonEnumConfig,
      { value : 0, enumerable : false, configurable : true, writable : true });
  Object.defineProperty(d, nonEnumNonConfig,
      { value : 0, enumerable : false, configurable : false, writable : true });
  d.mStrict();
  d.mSloppy();
}());


(function TestKeyedNumericSetterDoesNotReconfigure() {
  let nonEnumConfig = 42;
  let nonEnumNonConfig = 43;
  function Base() {}
  function Derived() {}

  Derived.prototype = {
    __proto__: Base.prototype,
    mStrict(){
      'use strict';
      super[nonEnumConfig] = 5;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumConfig);
      arktest.assertEQ(5, d1.value);
      arktest.assertTrue(d1.configurable);
      arktest.assertFalse(d1.enumerable);

      super[nonEnumNonConfig] = 5;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumNonConfig);
      arktest.assertEQ(5, d1.value);
      arktest.assertFalse(d1.configurable);
      arktest.assertFalse(d1.enumerable);
    },
    mSloppy(){
      super[nonEnumConfig] = 42;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumConfig);
      arktest.assertEQ(42, d1.value);
      arktest.assertTrue(d1.configurable);
      arktest.assertFalse(d1.enumerable);

      super[nonEnumNonConfig] = 42;
      let d1 = Object.getOwnPropertyDescriptor(this, nonEnumNonConfig);
      arktest.assertEQ(42, d1.value);
      arktest.assertFalse(d1.configurable);
      arktest.assertFalse(d1.enumerable);
    }
  };

  let d = new Derived();
  Object.defineProperty(d, nonEnumConfig,
      { value : 0, enumerable : false, configurable : true, writable : true });
  Object.defineProperty(d, nonEnumNonConfig,
      { value : 0, enumerable : false, configurable : false, writable : true });
  d.mStrict();
  d.mSloppy();
}());


(function TestCountOperations() {
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      return this._x;
    },
    set x(v) {
      this._x = v;
    },
    _x: 1
  };

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 2,
    testCounts() {
      arktest.assertEQ(2, this._x);
      arktest.assertEQ(2, super.x);
      super.x++;
      arktest.assertEQ(3, super.x);
      ++super.x;
      arktest.assertEQ(4, super.x);
      arktest.assertEQ(4, super.x++);
      arktest.assertEQ(5, super.x);
      arktest.assertEQ(6, ++super.x);
      arktest.assertEQ(6, super.x);
      arktest.assertEQ(6, this._x);

      super.x--;
      arktest.assertEQ(5, super.x);
      --super.x;
      arktest.assertEQ(4, super.x);
      arktest.assertEQ(4, super.x--);
      arktest.assertEQ(3, super.x);
      arktest.assertEQ(2, --super.x);
      arktest.assertEQ(2, super.x);
      arktest.assertEQ(2, this._x);
    }
  };
  new Derived().testCounts();
}());


(function TestKeyedCountOperations() {
  let x = 'x';
  function Base() {}
  Base.prototype = {
    constructor: Base,
    get x() {
      return this._x;
    },
    set x(v) {
      this._x = v;
    },
    _x: 1
  };

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 2,
    testCounts() {
      arktest.assertEQ(2, this._x);
      arktest.assertEQ(2, super[x]);
      super[x]++;
      arktest.assertEQ(3, super[x]);
      ++super[x];
      arktest.assertEQ(4, super[x]);
      arktest.assertEQ(4, super[x]++);
      arktest.assertEQ(5, super[x]);
      arktest.assertEQ(6, ++super[x]);
      arktest.assertEQ(6, super[x]);
      arktest.assertEQ(6, this._x);

      super[x]--;
      arktest.assertEQ(5, super[x]);
      --super[x];
      arktest.assertEQ(4, super[x]);
      arktest.assertEQ(4, super[x]--);
      arktest.assertEQ(3, super[x]);
      arktest.assertEQ(2, --super[x]);
      arktest.assertEQ(2, super[x]);
      arktest.assertEQ(2, this._x);
    }
  };
  new Derived().testCounts();
}());


(function TestKeyedNumericCountOperations() {
  let x = 42;
  function Base() {}
  Base.prototype = {
    constructor: Base,
    _x: 1
  };

  Object.defineProperty(Base.prototype, x, {
    get: function() { return this._x; },
    set: function(v) { this._x = v;; }
  });

  function Derived() {}
  Derived.__proto__ = Base;
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    _x: 2,
    testCounts() {
      arktest.assertEQ(2, this._x);
      arktest.assertEQ(2, super[x]);
      super[x]++;
      arktest.assertEQ(3, super[x]);
      ++super[x];
      arktest.assertEQ(4, super[x]);
      arktest.assertEQ(4, super[x]++);
      arktest.assertEQ(5, super[x]);
      arktest.assertEQ(6, ++super[x]);
      arktest.assertEQ(6, super[x]);
      arktest.assertEQ(6, this._x);

      super[x]--;
      arktest.assertEQ(5, super[x]);
      --super[x];
      arktest.assertEQ(4, super[x]);
      arktest.assertEQ(4, super[x]--);
      arktest.assertEQ(3, super[x]);
      arktest.assertEQ(2, --super[x]);
      arktest.assertEQ(2, super[x]);
      arktest.assertEQ(2, this._x);
    }
  };
  new Derived().testCounts();
}());


(function TestSetterSuperNonWritable() {
  function Base() {}
  Object.defineProperty(Base.prototype, 'x', { value : 27, writable: false });
  function Derived() {}
  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    mSloppy() {
      arktest.assertEQ(27, super.x);
      arktest.assertEQ(27, this.x);
      super.x = 10;
      arktest.assertEQ(27, super.x);
      arktest.assertEQ(27, this.x);
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(27, super.x);
      arktest.assertEQ(27, this.x);
      let ex = null;
      try { super.x = 10; } catch(e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ(27, super.x);
      arktest.assertEQ(27, this.x);
    }
  };
  new Derived().mSloppy();
  new Derived().mStrict();
}());


(function TestSetterKeyedSuperNonWritable() {
  let x = 'xyz';
  function Base() {}
  Object.defineProperty(Base.prototype, x, { value : 27, writable: false });
  function Derived() {}

  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    mSloppy() {
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
      super[x] = 10;
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
      let ex = null;
      try { super[x] = 10; } catch(e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
    }
  };
  new Derived().mSloppy();
  new Derived().mStrict();
}());


(function TestSetterKeyedNumericSuperNonWritable() {
  let x = 42;
  function Base() {}
  Object.defineProperty(Base.prototype, x, { value : 27, writable: false });
  function Derived() {}

  Derived.prototype = {
    __proto__: Base.prototype,
    constructor: Derived,
    mSloppy() {
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
      super[x] = 10;
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
    },
    mStrict() {
      'use strict';
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
      let ex = null;
      try { super[x] = 10; } catch(e) { ex = e; }
      arktest.assertTrue(ex instanceof TypeError);
      arktest.assertEQ(27, super[x]);
      arktest.assertEQ(27, this[x]);
    }
  };
  new Derived().mSloppy();
  new Derived().mStrict();
}());


(function TestSuperCall() {
  'use strict';

  let baseCalled = 0;
  let derivedCalled = 0;
  let derivedDerivedCalled = 0;

  class Base {
    constructor() {
      baseCalled++;
    }
  }

  class Derived extends Base {
    constructor() {
      let r = super();
      arktest.assertEQ(this, r);
      derivedCalled++;
    }
  }

  arktest.assertEQ(Base, Base.prototype.constructor);
  arktest.assertEQ(Base.prototype, Derived.prototype.__proto__);

  baseCalled = 0;
  derivedCalled = 0;
  new Derived();
  arktest.assertEQ(1, baseCalled);
  arktest.assertEQ(1, derivedCalled);

  class DerivedDerived extends Derived {
    constructor() {
      let r = super();
      arktest.assertEQ(this, r);
      derivedDerivedCalled++;
    }
  }

  baseCalled = 0;
  derivedCalled = 0;
  derivedDerivedCalled = 0;
  new DerivedDerived();
  arktest.assertEQ(1, baseCalled);
  arktest.assertEQ(1, derivedCalled);
  arktest.assertEQ(1, derivedDerivedCalled);

  class Base2 {
    constructor(v) {
      this.fromBase = v;
    }
  }
  class Derived2 extends Base2 {
    constructor(v1, v2) {
      let r = super(v1);
      arktest.assertEQ(this, r);
      this.fromDerived = v2;
    }
  }

  let d = new Derived2('base', 'derived');
  arktest.assertEQ('base', d.fromBase);
  arktest.assertEQ('derived', d.fromDerived);

  let calls = 0;
  class G {
    constructor() {
      calls++;
    }
  }

  class F extends Object {
    constructor() {
      super();
    }
  }
  F.__proto__ = G;
  new F();
  arktest.assertEQ(1, calls);
  F.__proto__ = function() {};
  new F();
  arktest.assertEQ(1, calls);
}());


(function TestExtendsObject() {
  'use strict';
  class F extends Object { }
  let f = new F(42);

  arktest.assertTrue(f instanceof F);
  arktest.assertTrue(f instanceof Object);
}());


(function TestSuperCallErrorCases() {
  'use strict';
  class T extends Object {
    constructor() {
      super();
    }
  }

  T.__proto__ = null;
  arktest.expectThrow(function() { new T(); }, ((e: Error): boolean => e instanceof TypeError));
}());


(function TestSuperPropertyInEval() {
  'use strict';
  let y = 3;
  class Base {
    m() { return 1; }
    get x() { return 2; }
  }
  class Derived extends Base {
    evalM() {
      arktest.assertEQ(1, eval('super.m()'));
    }
    evalX() {
      arktest.assertEQ(2, eval('super.x'));
    }
    globalEval1() {
      arktest.expectThrow('super.x', ((e: Error): boolean => e instanceof SyntaxError));
      arktest.expectThrow('super.m()', ((e: Error): boolean => e instanceof SyntaxError));
    }
    globalEval2() {
      super.x;
      arktest.expectThrow('super.x', ((e: Error): boolean => e instanceof SyntaxError));
      arktest.expectThrow('super.m()', ((e: Error): boolean => e instanceof SyntaxError));
    }
  }
  let d = new Derived();
  d.globalEval1();
  d.globalEval2();
  d.evalM();
  d.evalX();
})();


(function TestSuperPropertyInArrow() {
  'use strict';
  let y = 3;
  class Base {
    m() { return 1; }
    get x() { return 2; }
  }
  class Derived extends Base {
    arrow() {
      arktest.assertEQ(super.x, (() => super.x)());
      arktest.assertEQ(super.m(), (() => super.m())());
      return (() => super.m())();
    }
  }
  let d = new Derived();
  arktest.assertEQ(1, d.arrow());
})();


(function TestSuperInOtherScopes() {
  const p = {x: 99};
  const o0 = {__proto__: p, f() { return eval('\'use strict\'; super.x') }};
  arktest.assertEQ(p.x, o0.f());
  const o1 = {__proto__: p, f() { with ({}) return super.x }};
  arktest.assertEQ(p.x, o1.f());
  const o2 = {__proto__: p, f({a}) { return super.x }};
  arktest.assertEQ(p.x, o2.f({}));
  const o3 = {__proto__: p, f(...a) { return super.x }};
  arktest.assertEQ(p.x, o3.f());
  const o4 = {__proto__: p, f() { 'use strict'; { let x; return super.x } }};
  arktest.assertEQ(p.x, o4.f());
})();


(function TestSuperCallInOtherScopes() {
  class C {constructor() { this.x = 99 }}
  class D0 extends C {constructor() { eval('\'use strict\'; super()') }}
  arktest.assertEQ(99, (new D0).x);
  class D2 extends C {constructor({a}) { super() }}
  arktest.assertEQ(99, (new D2({})).x);
  class D3 extends C {constructor(...a) { super() }}
  arktest.assertEQ(99, (new D3()).x);
  class D4 extends C {constructor() { { let x; super() } }}
  arktest.assertEQ(99, (new D4).x);
})();


(function TestSuperCallInEval() {
  'use strict';
  class Base {
    constructor(x) {
      this.x = x;
    }
  }
  class Derived extends Base {
    constructor(x) {
      let r = eval('super(x)');
      arktest.assertEQ(this, r);
    }
  }
  let d = new Derived(42);
  arktest.assertEQ(42, d.x);
})();


(function TestSuperCallInArrow() {
  'use strict';
  class Base {
    constructor(x) {
      this.x = x;
    }
  }
  class Derived extends Base {
    constructor(x) {
      let r = (() => super(x))();
      arktest.assertEQ(this, r);
    }
  }
  let d = new Derived(42);
  arktest.assertEQ(42, d.x);
})();


(function TestSuperCallEscapes() {
  'use strict';
  class Base {
    constructor(x) {
      this.x = x;
    }
  }

  let f;
  class Derived extends Base {
    constructor() {
      f = () => super(2);
    }
  }
  arktest.expectThrow(function() {
    new Derived();
  }, ((e: Error): boolean => e instanceof ReferenceError));

  let o = f();
  arktest.assertEQ(2, o.x);
  arktest.assertTrue(o instanceof Derived);

  arktest.expectThrow(function() {
    f();
  }, ((e: Error): boolean => e instanceof ReferenceError));
})();


(function TestSuperCallInLoop() {
  'use strict';
  class Base {
    constructor(x) {
      this.x = x;
    }
  }
  class Derived extends Base {
    constructor(x, n) {
      for (let i = 0; i < n; ++i) {
        super(x);
      }
    }
  }

  let o = new Derived(23, 1);
  arktest.assertEQ(23, o.x);
  arktest.assertTrue(o instanceof Derived);

  arktest.expectThrow('new Derived(42, 0)', ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow('new Derived(65, 2)', ((e: Error): boolean => e instanceof ReferenceError));
})();


(function TestSuperCallReentrant() {
  'use strict';
  class Base {
    constructor(fun) {
      this.x = fun();
    }
  }
  class Derived extends Base {
    constructor(x) {
      let f = () => super(() => x)
      super(f);
    }
  }
  arktest.expectThrow('new Derived(23)', ((e: Error): boolean => e instanceof ReferenceError));
})();


(function TestSuperCallSpreadInEval() {
  'use strict';
  class Base {
    constructor(x) {
      this.x = x;
    }
  }
  class Derived extends Base {
    constructor(x) {
      let r = eval('super(...[x])');
      arktest.assertEQ(this, r);
    }
  }
  let d = new Derived(42);
  arktest.assertEQ(42, d.x);
})();


(function TestSuperCallSpreadInArrow() {
  'use strict';
  class Base {
    constructor(x) {
      this.x = x;
    }
  }
  class Derived extends Base {
    constructor(x) {
      let r = (() => super(...[x]))();
      arktest.assertEQ(this, r);
    }
  }
  let d = new Derived(42);
  arktest.assertEQ(42, d.x);
})();

(function TestNullSuperPropertyLoad() {
  let obj = {
    __proto__: null,
    named() { return super.x },
    keyed() { return super[5] }
  };
  arktest.expectThrow(obj.named, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(obj.keyed, ((e: Error): boolean => e instanceof TypeError));
  class C extends null {
    named() { return super.x }
    keyed() { return super[5] }
  }
  arktest.expectThrow(C.prototype.named, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(C.prototype.keyed, ((e: Error): boolean => e instanceof TypeError));
})();

(function TestNullSuperPropertyStore() {
  let obj = {
    __proto__: null,
    named() { super.x = 42 },
    keyed() { super[5] = 42 }
  };
  arktest.expectThrow(obj.named, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(obj.keyed, ((e: Error): boolean => e instanceof TypeError));
  class C extends null {
    named() { super.x = 42 }
    keyed() { super[5] = 42 }
  }
  arktest.expectThrow(C.prototype.named, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(C.prototype.keyed, ((e: Error): boolean => e instanceof TypeError));
})();

(function TestDeleteSuperPropertyEvaluationOrder() {
  let i = 0;
  class Base {}
  class Derived extends Base {
    test() {
      delete super[i++];
    }
  }
  arktest.expectThrow(Derived.prototype.test, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(1, i);
})();
