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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function printDesc(desc, s) {
  let json;
  if (desc) {
    json = JSON.stringify(desc);
  } else {
    json = '<no such property>';
  }
  if (s === undefined) {
    print(json);
  } else {
    print(s + ': ' + json);
  }
}


let counters;
let testRealm;
let cfg;


function getDescriptor() {
  let code = 'Object.getOwnPropertyDescriptor(global, "x")';
  let desc = Realm.eval(testRealm, code);
  return desc;
}

function setUp() {
  counters = {};
  Realm.shared = {counters: counters};
  testRealm = Realm.create();
  Realm.eval(testRealm, 'var global = Realm.global(Realm.current());');
  print('=====================');
  print('Test realm: ' + testRealm);
  arktest.assertEQ(undefined, getDescriptor());
}

function tearDown() {
  Realm.dispose(testRealm);
  print('OK');
}


function addStrict(code, cfg) {
  return cfg.strict ? '"use strict"; ' + code : code;
}

function forceMutablePropertyCellType() {
  Realm.eval(testRealm, 'global.x = {}; global.x = undefined;');
}

function declareVar() {
  let code = 'var x;';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function defineVar(v) {
  let code = 'var x = ' + v;
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function defineLoadVar() {
  let name = 'LoadVar_' + testRealm;
  let code =
      'var x;' +
      'function ' + name + '() {' +
      '  return x;' +
      '};'
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function loadVar() {
  let name = 'LoadVar_' + testRealm;
  let code = (cfg.optimize ? 'ArkTools.prepareFunctionForOptimization(' + name + ');' : '') +
      (cfg.optimize ? 'ArkTools.optimizeFunctionOnNextCall(' + name + ');' : '') +
      name + '();';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function defineStoreVar() {
  let name = 'StoreVar_' + testRealm;
  let code = 'var g = (Function("return this"))();' +
      'var x;' +
      'function ' + name + '(v) {' +
      '  return x = v;' +
      '};';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function storeVar(v) {
  let name = 'StoreVar_' + testRealm;
  let code = (cfg.optimize ? 'ArkTools.prepareFunctionForOptimization(' + name + ');' : '') +
      (cfg.optimize ? 'ArkTools.optimizeFunctionOnNextCall(' + name + ');' : '') +
      name + '(' + v + ');';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

// It does 13 iterations which results in 27 loads
// and 14 stores.
function loadStoreLoop() {
  let code = 'for(var x = 0; x < 13; x++);';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function defineRWDataProperty() {
  let code =
      'Object.defineProperty(global, "x", { ' +
      '  value: 42, ' +
      '  writable: true, ' +
      '  enumerable: true, ' +
      '  configurable: true ' +
      '});';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function defineRODataProperty() {
  let code =
      'Object.defineProperty(global, "x", { ' +
      '  value: 42, ' +
      '  writable: false, ' +
      '  enumerable: true, ' +
      '  configurable: true ' +
      '});';
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function setX(v) {
  let code =
      'global.x_ = ' + v + '; ';
  return Realm.eval(testRealm, code);
}

function defineRWAccessorProperty() {
  let code =
      'Object.defineProperty(global, "x", {' +
      '  get: function() { Realm.shared.counters.get_count++; return this.x_; },' +
      '  set: function(v) { Realm.shared.counters.set_count++; this.x_ = v; },' +
      '  enumerable: true, configurable: true' +
      '});';
  counters.get_count = 0;
  counters.set_count = 0;
  return Realm.eval(testRealm, addStrict(code, cfg));
}

function defineROAccessorProperty() {
  let code =
      'Object.defineProperty(global, "x", {' +
      '  get: function() { Realm.shared.counters.get_count++; return this.x_; },' +
      '  enumerable: true, configurable: true' +
      '});';
  counters.get_count = 0;
  counters.set_count = 0;
  return Realm.eval(testRealm, addStrict(code, cfg));
}


function testSuite(optCfg) {
  //
  // Non strict.
  //

  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: false};
    declareVar();
    defineLoadVar();
    defineStoreVar();
    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(false, getDescriptor().configurable);

    // Force property cell type to kMutable.
    defineVar(undefined);
    defineVar(153);
    arktest.assertEQ(false, getDescriptor().configurable);

    arktest.assertEQ(153, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(113, loadVar());
    loadStoreLoop();
    arktest.assertEQ(13, loadVar());
    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: false};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineRWDataProperty();
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(true, getDescriptor().configurable);

    defineVar(153);
    arktest.assertEQ(true, getDescriptor().configurable);

    arktest.assertEQ(153, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(113, loadVar());
    loadStoreLoop();
    arktest.assertEQ(13, loadVar());

    // Now reconfigure to accessor.
    defineRWAccessorProperty();
    arktest.assertEQ(undefined, getDescriptor().value);
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(0, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    loadStoreLoop();
    arktest.assertEQ(28, counters.get_count);
    arktest.assertEQ(14, counters.set_count);

    arktest.assertEQ(13, loadVar());
    arktest.assertEQ(29, counters.get_count);
    arktest.assertEQ(14, counters.set_count);

    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: false};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineRODataProperty();
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(true, getDescriptor().configurable);

    defineVar(153);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(42, loadVar());
    loadStoreLoop();
    arktest.assertEQ(42, loadVar());

    // Now reconfigure to accessor property.
    defineRWAccessorProperty();
    arktest.assertEQ(undefined, getDescriptor().value);
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(0, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    loadStoreLoop();
    arktest.assertEQ(28, counters.get_count);
    arktest.assertEQ(14, counters.set_count);

    arktest.assertEQ(13, loadVar());
    arktest.assertEQ(29, counters.get_count);
    arktest.assertEQ(14, counters.set_count);

    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: false};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineRWAccessorProperty();
    arktest.assertEQ(0, counters.get_count);
    arktest.assertEQ(0, counters.set_count);
    arktest.assertEQ(true, getDescriptor().configurable);

    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    defineVar(153);
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(1, counters.set_count);

    arktest.assertEQ(153, loadVar());
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(1, counters.set_count);

    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(2, counters.set_count);

    arktest.assertEQ(113, loadVar());
    arktest.assertEQ(3, counters.get_count);
    arktest.assertEQ(2, counters.set_count);

    loadStoreLoop();
    arktest.assertEQ(30, counters.get_count);
    arktest.assertEQ(16, counters.set_count);

    arktest.assertEQ(13, loadVar());
    arktest.assertEQ(31, counters.get_count);
    arktest.assertEQ(16, counters.set_count);

    // Now reconfigure to data property.
    defineRWDataProperty();
    arktest.assertEQ(42, getDescriptor().value);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(31, counters.get_count);
    arktest.assertEQ(16, counters.set_count);

    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: false};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineROAccessorProperty();
    arktest.assertEQ(0, counters.get_count);
    arktest.assertEQ(0, counters.set_count);
    arktest.assertEQ(true, getDescriptor().configurable);

    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    setX(42);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    defineVar(153);
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(3, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(3, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(4, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    loadStoreLoop();
    arktest.assertEQ(5, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(6, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    // Now reconfigure to data property.
    defineRWDataProperty();
    arktest.assertEQ(42, getDescriptor().value);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(6, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    tearDown();
  })();


  //
  // Strict.
  //

  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: true};
    declareVar();
    defineLoadVar();
    defineStoreVar();
    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(false, getDescriptor().configurable);

    // Force property cell type to kMutable.
    defineVar(undefined);
    defineVar(153);
    arktest.assertEQ(false, getDescriptor().configurable);

    arktest.assertEQ(153, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(113, loadVar());
    loadStoreLoop();
    arktest.assertEQ(13, loadVar());
    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: true};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineRWDataProperty();
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(true, getDescriptor().configurable);

    defineVar(153);
    arktest.assertEQ(true, getDescriptor().configurable);

    arktest.assertEQ(153, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(113, loadVar());
    loadStoreLoop();
    arktest.assertEQ(13, loadVar());
    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: true};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineRWDataProperty();
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(true, getDescriptor().writable);
    arktest.assertEQ(113, storeVar(113));

    defineRODataProperty();
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(false, getDescriptor().writable);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(42, loadVar());
    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: true};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineRWAccessorProperty();
    arktest.assertEQ(0, counters.get_count);
    arktest.assertEQ(0, counters.set_count);
    arktest.assertEQ(true, getDescriptor().configurable);

    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    defineVar(153);
    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(1, counters.set_count);

    arktest.assertEQ(153, loadVar());
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(1, counters.set_count);

    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(2, counters.set_count);

    arktest.assertEQ(113, loadVar());
    arktest.assertEQ(3, counters.get_count);
    arktest.assertEQ(2, counters.set_count);

    loadStoreLoop();
    arktest.assertEQ(30, counters.get_count);
    arktest.assertEQ(16, counters.set_count);

    arktest.assertEQ(13, loadVar());
    arktest.assertEQ(31, counters.get_count);
    arktest.assertEQ(16, counters.set_count);

    // Now reconfigure to data property.
    defineRWDataProperty();
    arktest.assertEQ(42, getDescriptor().value);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(31, counters.get_count);
    arktest.assertEQ(16, counters.set_count);

    tearDown();
  })();


  (function() {
    setUp();
    cfg = {optimize: optCfg.optimize, strict: true};
    forceMutablePropertyCellType();
    defineLoadVar();
    defineStoreVar();
    defineROAccessorProperty();
    arktest.assertEQ(0, counters.get_count);
    arktest.assertEQ(0, counters.set_count);
    arktest.assertEQ(true, getDescriptor().configurable);

    arktest.assertEQ(undefined, loadVar());
    arktest.assertEQ(1, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    setX(42);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(true, getDescriptor().configurable);
    arktest.assertEQ(2, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(3, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(3, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(4, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(4, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(5, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    // Now reconfigure to data property.
    defineRWDataProperty();
    arktest.assertEQ(42, getDescriptor().value);
    arktest.assertEQ(42, loadVar());
    arktest.assertEQ(113, storeVar(113));
    arktest.assertEQ(5, counters.get_count);
    arktest.assertEQ(0, counters.set_count);

    tearDown();
  })();

}  // testSuite


testSuite({optimize: false});
testSuite({optimize: true});
