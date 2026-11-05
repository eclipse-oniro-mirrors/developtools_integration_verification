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

const symbols = []


// Returns true if the string is a valid
// serialization of Symbols added to the 'symbols'
// array. Adjust if you extend 'symbols' with other
// values.
function isValidSymbolString(s) {
  return ['Symbol(66)', 'Symbol()'].indexOf(s) >= 0;
}


// Test different forms of constructor calls.
function testNew() {
  function indirectSymbol() { return Symbol() }
  function indirect() { return indirectSymbol() }
  for (let i = 0; i < 2; ++i) {
    ArkTools.prepareFunctionForOptimization(indirect);
    for (let j = 0; j < 5; ++j) {
      symbols.push(Symbol())
      symbols.push(Symbol(undefined))
      symbols.push(Symbol('66'))
      symbols.push(Symbol(66))
      symbols.push(Symbol().valueOf())
      symbols.push(indirect())
    }
    ArkTools.optimizeFunctionOnNextCall(indirect)
    indirect()  // Call once before GC throws away type feedback.
    ArkTools.gc()        // Promote existing symbols and then allocate some more.
  }
  arktest.expectThrow(function () { Symbol(Symbol()) }, ((e: Error): boolean => e instanceof TypeError))
  arktest.expectThrow(function () { new Symbol(66) }, ((e: Error): boolean => e instanceof TypeError))
}
testNew()


function testType() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ('symbol', typeof symbols[i])
    arktest.assertTrue(typeof symbols[i] === 'symbol')
    arktest.assertFalse(ArkTools.symbolIsPrivate(symbols[i]))
  });
}
testType()


function testPrototype() {
  arktest.assertEQ(Object.prototype, Symbol.prototype.__proto__)
  arktest.assertEQ(Symbol.prototype, Symbol().__proto__)
  arktest.assertEQ(Symbol.prototype, Object(Symbol()).__proto__)
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(Symbol.prototype, symbols[i].__proto__)
  });
}
testPrototype()


function testConstructor() {
  arktest.assertEQ(0, Symbol.length);
  arktest.assertEQ(Function.prototype, Symbol.__proto__)
  arktest.assertFalse(Object === Symbol.prototype.constructor)
  arktest.assertFalse(Symbol === Object.prototype.constructor)
  arktest.assertEQ(Symbol, Symbol.prototype.constructor)
  arktest.assertEQ(Symbol, Symbol().__proto__.constructor)
  arktest.assertEQ(Symbol, Object(Symbol()).__proto__.constructor)
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(Symbol, symbols[i].__proto__.constructor)
  });
}
testConstructor()


function testValueOf() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(symbols[i] === Object(symbols[i]).valueOf())
    arktest.assertTrue(symbols[i] === symbols[i].valueOf())
    arktest.assertTrue(Symbol.prototype.valueOf.call(Object(symbols[i])) === symbols[i])
    arktest.assertTrue(Symbol.prototype.valueOf.call(symbols[i]) === symbols[i])
  });
}
testValueOf()


function testToString() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.expectThrow(function() { new String(symbols[i]) }, ((e: Error): boolean => e instanceof TypeError))
    arktest.assertEQ(symbols[i].toString(), String(symbols[i]))
    arktest.expectThrow(function() { symbols[i] + '' }, ((e: Error): boolean => e instanceof TypeError))
    arktest.expectThrow(function() { String(Object(symbols[i])) }, ((e: Error): boolean => e instanceof TypeError))
    arktest.assertTrue(isValidSymbolString(symbols[i].toString()))
    arktest.assertTrue(isValidSymbolString(Object(symbols[i]).toString()))
    arktest.assertTrue(
      isValidSymbolString(Symbol.prototype.toString.call(symbols[i])))
    arktest.assertEQ(
      '[object Symbol]', Object.prototype.toString.call(symbols[i]))
  });
}
testToString()


function testToBoolean() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(Boolean(Object(symbols[i])))
    arktest.assertFalse(!Object(symbols[i]))
    arktest.assertTrue(Boolean(symbols[i]).valueOf())
    arktest.assertFalse(!symbols[i])
    arktest.assertTrue(!!symbols[i])
    arktest.assertTrue(symbols[i] && true)
    arktest.assertFalse(!symbols[i] && false)
    arktest.assertTrue(!symbols[i] || true)
    arktest.assertEQ(1, symbols[i] ? 1 : 2)
    arktest.assertEQ(2, !symbols[i] ? 1 : 2)
    if (!symbols[i]) { arktest.assertTrue(false); }
    if (symbols[i]) {} else arktest.assertTrue(false);
  });
}
testToBoolean()


function testToNumber() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.expectThrow(function() { Number(Object(symbols[i])) }, ((e: Error): boolean => e instanceof TypeError))
    arktest.expectThrow(function() { +Object(symbols[i]) }, ((e: Error): boolean => e instanceof TypeError))
    arktest.expectThrow(function() { Number(symbols[i]) }, ((e: Error): boolean => e instanceof TypeError))
    arktest.expectThrow(function() { symbols[i] + 0 }, ((e: Error): boolean => e instanceof TypeError))
  });
}
testToNumber()


function testEquality() {
  // Every symbol should equal itself, and non-strictly equal its wrapper.
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(symbols[i], symbols[i])
    arktest.assertEQ(symbols[i], symbols[i])
    arktest.assertTrue(Object.is(symbols[i], symbols[i]))
    arktest.assertTrue(symbols[i] === symbols[i])
    arktest.assertTrue(symbols[i] == symbols[i])
    arktest.assertFalse(symbols[i] === Object(symbols[i]))
    arktest.assertFalse(Object(symbols[i]) === symbols[i])
    arktest.assertTrue(symbols[i] == Object(symbols[i]))
    arktest.assertTrue(Object(symbols[i]) == symbols[i])
    arktest.assertTrue(symbols[i] === symbols[i].valueOf())
    arktest.assertTrue(symbols[i].valueOf() === symbols[i])
    arktest.assertTrue(symbols[i] == symbols[i].valueOf())
    arktest.assertTrue(symbols[i].valueOf() == symbols[i])
    arktest.assertFalse(Object(symbols[i]) === Object(symbols[i]))
    arktest.assertEQ(Object(symbols[i]).valueOf(), Object(symbols[i]).valueOf())
  });

  // All symbols should be distinct.
  for (let i = 0; i < symbols.length; ++i) {
    for (let j = i + 1; j < symbols.length; ++j) {
      arktest.assertFalse(Object.is(symbols[i], symbols[j]))
      arktest.assertFalse(symbols[i] === symbols[j])
      arktest.assertFalse(symbols[i] == symbols[j])
    }
  }

  // Symbols should not be equal to any other value (and the test terminates).
  const values = [347, 1.275, NaN, 'string', null, undefined, {}, function() {}]
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    values.forEach((_, arrayIndex) => {
      let j = arrayIndex.toString();
      arktest.assertFalse(symbols[i] === values[j])
      arktest.assertFalse(values[j] === symbols[i])
      arktest.assertFalse(symbols[i] == values[j])
      arktest.assertFalse(values[j] == symbols[i])
    }
  });
}
testEquality()


function testGet() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(isValidSymbolString(symbols[i].toString()))
    arktest.assertEQ(symbols[i], symbols[i].valueOf())
    arktest.assertEQ(undefined, symbols[i].a)
    arktest.assertEQ(undefined, symbols[i]['a' + 'b'])
    arktest.assertEQ(undefined, symbols[i]['' + '1'])
    arktest.assertEQ(undefined, symbols[i][62])
  });
}
testGet()


function testSet() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    symbols[i].toString = 0
    arktest.assertTrue(isValidSymbolString(symbols[i].toString()))
    symbols[i].valueOf = 0
    arktest.assertEQ(symbols[i], symbols[i].valueOf())
    symbols[i].a = 0
    arktest.assertEQ(undefined, symbols[i].a)
    symbols[i]['a' + 'b'] = 0
    arktest.assertEQ(undefined, symbols[i]['a' + 'b'])
    symbols[i][62] = 0
    arktest.assertEQ(undefined, symbols[i][62])
  });
}
testSet()


// Test Symbol wrapping/boxing over non-builtins.
Symbol.prototype.getThisProto = function () {
  return Object.getPrototypeOf(this);
}
function testCall() {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(symbols[i].getThisProto() === Symbol.prototype)
  });
}
testCall()


function testCollections() {
  const set = new Set
  const map = new Map
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    set.add(symbols[i])
    map.set(symbols[i], i)
  });
  arktest.assertEQ(symbols.length, set.size)
  arktest.assertEQ(symbols.length, map.size)
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(set.has(symbols[i]))
    arktest.assertTrue(map.has(symbols[i]))
    arktest.assertEQ(i, map.get(symbols[i]))
  });
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(set.delete(symbols[i]))
    arktest.assertTrue(map.delete(symbols[i]))
  });
  arktest.assertEQ(0, set.size)
  arktest.assertEQ(0, map.size)
}
testCollections()



function testKeySet(obj) {
  arktest.assertTrue(ArkTools.hasFastProperties(obj))
  // Set the even symbols via assignment.
  for (let i = 0; i < symbols.length; i += 2) {
    obj[symbols[i]] = i
    // Object should remain in fast mode until too many properties were added.
    arktest.assertTrue(ArkTools.hasFastProperties(obj) || i >= 30)
  }
}


function testKeyDefine(obj) {
  // Set the odd symbols via defineProperty (as non-enumerable).
  for (let i = 1; i < symbols.length; i += 2) {
    Object.defineProperty(obj, symbols[i], {value: i, configurable: true})
  }
}


function testKeyGet(obj) {
  const obj2 = Object.create(obj)
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(i|0, obj[symbols[i]])
    arktest.assertEQ(i|0, obj2[symbols[i]])
  });
}


function testKeyHas(obj) {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertTrue(symbols[i] in obj)
    arktest.assertTrue(Object.hasOwnProperty.call(obj, symbols[i]))
  });
}


function testKeyEnum(obj) {
  for (let name in obj) {
    arktest.assertEQ('string', typeof name)
  }
}


function testKeyNames(obj) {
  arktest.assertEQ(0, Object.keys(obj).length)

  const names = Object.getOwnPropertyNames(obj)
  for (let i in names) {
    arktest.assertEQ('string', typeof names[i])
  }
}


function testGetOwnPropertySymbols(obj) {
  let syms = Object.getOwnPropertySymbols(obj)
  arktest.assertEQ(syms.length, symbols.length)
  for (let i in syms) {
    arktest.assertEQ('symbol', typeof syms[i])
  }
}


function testKeyDescriptor(obj) {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    let desc = Object.getOwnPropertyDescriptor(obj, symbols[i])
    arktest.assertEQ(i|0, desc.value)
    arktest.assertTrue(desc.configurable)
    arktest.assertEQ(i % 2 == 0, desc.writable)
    arktest.assertEQ(i % 2 == 0, desc.enumerable)
    arktest.assertEQ(i % 2 == 0,
        Object.prototype.propertyIsEnumerable.call(obj, symbols[i]))
  });
}


function testKeyDelete(obj) {
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    delete obj[symbols[i]]
  });
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(obj, symbols[i]))
  });
}


const objs = [{}, [], Object.create({}), Object(1), new Map, function(){}]

objs.forEach((_, arrayIndex) => {

  let i = arrayIndex.toString();
  let obj = objs[i]
  testKeySet(obj)
  testKeyDefine(obj)
  testKeyGet(obj)
  testKeyHas(obj)
  testKeyEnum(obj)
  testKeyNames(obj)
  testGetOwnPropertySymbols(obj)
  testKeyDescriptor(obj)
  testKeyDelete(obj)
});


function testDefineProperties() {
  let properties = {}
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    Object.defineProperty(
        properties, symbols[i], {value: {value: i}, enumerable: i % 2 === 0})
  });
  let o = Object.defineProperties({}, properties)
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(i % 2 === 0, symbols[i] in o)
  });
}
testDefineProperties()


function testCreate() {
  let properties = {}
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    Object.defineProperty(
      properties, symbols[i], {value: {value: i}, enumerable: i % 2 === 0})
  });
  let o = Object.create(Object.prototype, properties)
  symbols.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(i % 2 === 0, symbols[i] in o)
  });
}
testCreate()


function testCachedKeyAfterScavenge() {
  ArkTools.gc();
  // Keyed property lookup are cached.  Hereby we assume that the keys are
  // tenured, so that we only have to clear the cache between mark compacts,
  // but not between scavenges.  This must also apply for symbol keys.
  const key = Symbol('key');
  let a = {};
  a[key] = 'abc';

  for (let i = 0; i < 100000; i++) {
    a[key] += 'a';  // Allocations cause a scavenge.
  }
}
testCachedKeyAfterScavenge();


function testGetOwnPropertySymbolsWithProto() {
  // We need to be have fast properties to have insertion order for property
  // keys. The current limit is currently 30 properties.
  let syms = symbols.slice(0, 30);
  const proto = {}
  const object = Object.create(proto)
  for (let i = 0; i < syms.length; i++) {
    // Even on object, odd on proto.
    if (i % 2) {
      proto[syms[i]] = i
    } else {
      object[syms[i]] = i
    }
  }

  arktest.assertTrue(ArkTools.hasFastProperties(object));

  const objectOwnSymbols = Object.getOwnPropertySymbols(object)
  arktest.assertEQ(objectOwnSymbols.length, syms.length / 2)

  for (let i = 0; i < objectOwnSymbols.length; i++) {
    arktest.assertEQ(objectOwnSymbols[i], syms[i * 2])
  }
}
testGetOwnPropertySymbolsWithProto()


function testWellKnown() {
  let symbols = [
    'hasInstance',
    // TODO(rossberg): reactivate once implemented.
    // "isConcatSpreadable", "isRegExp",
    'iterator', /* "toStringTag", */ 'unscopables'
  ]

  symbols.forEach((_, arrayIndex) => {

    let i = arrayIndex.toString();
    let name = symbols[i]
    let desc = Object.getOwnPropertyDescriptor(Symbol, name)
    arktest.assertEQ('symbol', typeof desc.value)
    arktest.assertEQ('Symbol(Symbol.' + name + ')', desc.value.toString())
    arktest.assertFalse(desc.writable)
    arktest.assertFalse(desc.configurable)
    arktest.assertFalse(desc.enumerable)

    arktest.assertFalse(Symbol.for('Symbol.' + name) === desc.value)
    arktest.assertTrue(Symbol.keyFor(desc.value) === undefined)
  });
}
testWellKnown()


function testRegistry() {
  const symbol1 = Symbol.for('x1')
  const symbol2 = Symbol.for('x2')
  arktest.assertFalse(symbol1 === symbol2)

  arktest.assertEQ(symbol1, Symbol.for('x1'))
  arktest.assertEQ(symbol2, Symbol.for('x2'))
  arktest.assertEQ('x1', Symbol.keyFor(symbol1))
  arktest.assertEQ('x2', Symbol.keyFor(symbol2))

  arktest.assertEQ(Symbol.for('1'), Symbol.for(1))
  arktest.expectThrow(function() { Symbol.keyFor('bla') }, ((e: Error): boolean => e instanceof TypeError))
  arktest.expectThrow(function() { Symbol.keyFor({}) }, ((e: Error): boolean => e instanceof TypeError))

  const realm = Realm.create()
  arktest.assertFalse(Symbol === Realm.eval(realm, 'Symbol'))
  arktest.assertFalse(Symbol.for === Realm.eval(realm, 'Symbol.for'))
  arktest.assertFalse(Symbol.keyFor === Realm.eval(realm, 'Symbol.keyFor'))
  arktest.assertEQ(Symbol.create, Realm.eval(realm, 'Symbol.create'))
  arktest.assertEQ(Symbol.iterator, Realm.eval(realm, 'Symbol.iterator'))

  arktest.assertEQ(symbol1, Realm.eval(realm, 'Symbol.for')('x1'))
  arktest.assertEQ(symbol1, Realm.eval(realm, 'Symbol.for(\'x1\')'))
  arktest.assertEQ('x1', Realm.eval(realm, 'Symbol.keyFor')(symbol1))
  Realm.shared = symbol1
  arktest.assertEQ('x1', Realm.eval(realm, 'Symbol.keyFor(Realm.shared)'))

  const symbol3 = Realm.eval(realm, 'Symbol.for(\'x3\')')
  arktest.assertFalse(symbol1 === symbol3)
  arktest.assertFalse(symbol2 === symbol3)
  arktest.assertEQ(symbol3, Symbol.for('x3'))
  arktest.assertEQ('x3', Symbol.keyFor(symbol3))
}
testRegistry()


function testGetOwnPropertySymbolsOnPrimitives() {
  arktest.assertEQ(Object.getOwnPropertySymbols(true), []);
  arktest.assertEQ(Object.getOwnPropertySymbols(5000), []);
  arktest.assertEQ(Object.getOwnPropertySymbols('OK'), []);
}
testGetOwnPropertySymbolsOnPrimitives();


function TestComparison() {
  function lt() { let a = Symbol(); let b = Symbol(); a < b; }
  function gt() { let a = Symbol(); let b = Symbol(); a > b; }
  function le() { let a = Symbol(); let b = Symbol(); a <= b; }
  function ge() { let a = Symbol(); let b = Symbol(); a >= b; }
  function lt_same() { let a = Symbol(); a < a; }
  function gt_same() { let a = Symbol(); a > a; }
  function leSame() { let a = Symbol(); a <= a; }
  function geSame() { let a = Symbol(); a >= a; }

  const throwFuncs = [lt, gt, le, ge, lt_same, gt_same, leSame, geSame];

  for (let f of throwFuncs) {
    ArkTools.prepareFunctionForOptimization(f);
    arktest.expectThrow(f, ((e: Error): boolean => e instanceof TypeError));
    ArkTools.optimizeFunctionOnNextCall(f);
    arktest.expectThrow(f, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(f, ((e: Error): boolean => e instanceof TypeError));
  }
}
TestComparison();


// Make sure that throws occur in the context of the Symbol function.
function testContext() {
  const r = Realm.create();
  const rSymbol = Realm.eval(r, 'Symbol');
  const rError = Realm.eval(r, 'TypeError');

  function verifier(symbol, error) {
    try {
      new symbol();
    } catch(e) {
      return e.__proto__ === error.__proto__;
    }
    arktest.assertTrue(false);  // should never get here.
  }

  arktest.assertTrue(verifier(Symbol, TypeError()));
  arktest.assertTrue(verifier(rSymbol, rError()));
  arktest.assertFalse(verifier(Symbol, rError()));
  arktest.assertFalse(verifier(rSymbol, TypeError()));
}
testContext();


function testStringify(expected, input) {
  arktest.assertEQ(expected, JSON.stringify(input));
  arktest.assertEQ(expected, JSON.stringify(input, (key, value) => value));
  arktest.assertEQ(JSON.stringify(input, null, '='),
               JSON.stringify(input, (key, value) => value, '='));
}

testStringify(undefined, Symbol('a'));
testStringify('[{}]', [Object(Symbol())]);
const symbolWrapper = Object(Symbol('a'))
testStringify('{}', symbolWrapper);
symbolWrapper.a = 1;
testStringify('{"a":1}', symbolWrapper);
