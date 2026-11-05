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

// This is adapted from mjsunit/harmony/set-prototype-of.js.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function getObjects() {
  function Func() {}
  return [
    Func,
    new Func(),
    {x: 5},
    /regexp/,
    ['array'],
    // new Error(),
    new Date(),
    Object(1),
    Object(true),
    Object('str'),
    Object(Symbol())
  ];
}


let coercibleValues = [
  1,
  true,
  'string',
  Symbol()
];


let nonCoercibleValues = [
  undefined,
  null
];


let valuesWithoutNull = coercibleValues.concat(undefined);


function testSetPrototypeOfCoercibleValues() {
  for (let i = 0; i < coercibleValues.length; i++) {
    let value = coercibleValues[i];
    let proto = Object.getPrototypeOf(value);
    arktest.expectThrow(
      function() { Reflect.setPrototypeOf(value, {}) },
      ((e: Error): boolean => e instanceof TypeError)
    );
    arktest.assertEQ(proto, Object.getPrototypeOf(value));
  }
}
testSetPrototypeOfCoercibleValues();


function testSetPrototypeOfNonCoercibleValues() {
  for (let i = 0; i < nonCoercibleValues.length; i++) {
    let value = nonCoercibleValues[i];
    arktest.expectThrow(function() {
      Reflect.setPrototypeOf(value, {});
    }, ((e: Error): boolean => e instanceof TypeError));
  }
}
testSetPrototypeOfNonCoercibleValues();


function testSetPrototypeToNonObject(proto) {
  let objects = getObjects();
  for (let i = 0; i < objects.length; i++) {
    let object = objects[i];
    for (let j = 0; j < valuesWithoutNull.length; j++) {
      let proto = valuesWithoutNull[j];
      arktest.expectThrow(function() {
        Reflect.setPrototypeOf(object, proto);
      }, ((e: Error): boolean => e instanceof TypeError));
    }
  }
}
testSetPrototypeToNonObject();


function testSetPrototypeOf(object, proto) {
  arktest.assertTrue(Reflect.setPrototypeOf(object, proto));
  arktest.assertEQ(Object.getPrototypeOf(object), proto);
}


function testSetPrototypeOfForObjects() {
  const objects1 = getObjects();
  const objects2 = getObjects();
  for (let i = 0; i < objects1.length; i++) {
    for (let j = 0; j < objects2.length; j++) {
      testSetPrototypeOf(objects1[i], objects2[j]);
    }
  }
}
testSetPrototypeOfForObjects();


function testSetPrototypeToNull() {
  let objects = getObjects();
  for (let i = 0; i < objects.length; i++) {
    testSetPrototypeOf(objects[i], null);
  }
}
testSetPrototypeToNull();


function testSetPrototypeOfNonExtensibleObject() {
  let objects = getObjects();
  let proto = {};
  for (let i = 0; i < objects.length; i++) {
    let object = objects[i];
    Object.preventExtensions(object);
    // Setting the current prototype must succeed.
    arktest.assertTrue(Reflect.setPrototypeOf(object, Object.getPrototypeOf(object)));
    // Setting any other must fail.
    arktest.assertFalse(Reflect.setPrototypeOf(object, proto));
  }
}
testSetPrototypeOfNonExtensibleObject();


function testSetPrototypeCyclic() {
  let objects = [
    Object.prototype, {},
    Array.prototype, [],
    Error.prototype, new TypeError,
    // etc ...
  ];
  for (let i = 0; i < objects.length; i += 2) {
    let object = objects[i];
    let value = objects[i + 1];
    arktest.assertFalse(Reflect.setPrototypeOf(object, value));
  }
}
testSetPrototypeCyclic();


function testLookup() {
  let object = {};
  arktest.assertFalse('x' in object);
  arktest.assertFalse('y' in object);

  const oldProto = {
    x: 'old x',
    y: 'old y'
  };
  arktest.assertTrue(Reflect.setPrototypeOf(object, oldProto));
  arktest.assertEQ(object.x, 'old x');
  arktest.assertEQ(object.y, 'old y');

  const newProto = {
    x: 'new x'
  };
  arktest.assertTrue(Reflect.setPrototypeOf(object, newProto));
  arktest.assertEQ(object.x, 'new x');
  arktest.assertFalse('y' in object);
}
testLookup();
