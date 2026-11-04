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

// Tests the Reflect.defineProperty method - ES6 26.1.3
// This is adapted from mjsunit/object-define-property.js.



// Check that an exception is thrown when null is passed as object.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0143: Unresolved reference Reflect"
---*/

let exception = false;
try {
  Reflect.defineProperty(null, null, null);
} catch (e) {
  exception = true;
  arktest.assertTrue(/called on non-object/.test(e));
}
arktest.assertTrue(exception);

// Check that an exception is thrown when undefined is passed as object.
exception = false;
try {
  Reflect.defineProperty(undefined, undefined, undefined);
} catch (e) {
  exception = true;
  arktest.assertTrue(/called on non-object/.test(e));
}
arktest.assertTrue(exception);

// Check that an exception is thrown when non-object is passed as object.
exception = false;
try {
  Reflect.defineProperty(0, 'foo', undefined);
} catch (e) {
  exception = true;
  arktest.assertTrue(/called on non-object/.test(e));
}
arktest.assertTrue(exception);

// Object.
let obj1 = {};

// Values.
let val1 = 0;
let val2 = 0;
let val3 = 0;

function setter1() {val1++; }
function getter1() {return val1; }

function setter2() {val2++; }
function getter2() {return val2; }

function setter3() {val3++; }
function getter3() {return val3; }


// Descriptors.
const emptyDesc = {};

const accessorConfigurable = {
    set: setter1,
    get: getter1,
    configurable: true
};

const accessorNoConfigurable = {
    set: setter2,
    get: getter2,
    configurable: false
};

const accessorOnlySet = {
  set: setter3,
  configurable: true
};

const accessorOnlyGet = {
  get: getter3,
  configurable: true
};

const accessorDefault = {set: function(){} };

const dataConfigurable = { value: 1000, configurable: true };

const dataNoConfigurable = { value: 2000, configurable: false };

const dataWritable = { value: 3000, writable: true};


// Check that we can't add property with undefined attributes.
arktest.expectThrow(function() { Reflect.defineProperty(obj1, 'foo', undefined) },
  TypeError);

// Make sure that we can add a property with an empty descriptor and
// that it has the default descriptor values.
arktest.assertTrue(Reflect.defineProperty(obj1, 'foo', emptyDesc));

// foo should be undefined as it has no get, set or value
arktest.assertEQ(undefined, obj1.foo);

// We should, however, be able to retrieve the propertydescriptor which should
// have all default values (according to 8.6.1).
let desc = Object.getOwnPropertyDescriptor(obj1, 'foo');
arktest.assertFalse(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.writable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);
arktest.assertEQ(desc.value, undefined);

// Make sure that getOwnPropertyDescriptor does not return a descriptor
// with default values if called with non existing property (otherwise
// the test above is invalid).
desc = Object.getOwnPropertyDescriptor(obj1, 'bar');
arktest.assertEQ(desc, undefined);

// Make sure that foo can't be reset (as configurable is false).
arktest.assertFalse(Reflect.defineProperty(obj1, 'foo', accessorConfigurable));


// Accessor properties

arktest.assertTrue(Reflect.defineProperty(obj1, 'bar', accessorConfigurable));
desc = Object.getOwnPropertyDescriptor(obj1, 'bar');
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorConfigurable.get);
arktest.assertEQ(desc.set, accessorConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj1.bar = 1);
arktest.assertEQ(1, val1);
arktest.assertEQ(1, obj1.bar = 1);
arktest.assertEQ(2, val1);
arktest.assertEQ(2, obj1.bar);

// Redefine bar with non configurable test
arktest.assertTrue(Reflect.defineProperty(obj1, 'bar', accessorNoConfigurable));
desc = Object.getOwnPropertyDescriptor(obj1, 'bar');
arktest.assertFalse(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorNoConfigurable.get);
arktest.assertEQ(desc.set, accessorNoConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj1.bar = 1);
arktest.assertEQ(2, val1);
arktest.assertEQ(1, val2);
arktest.assertEQ(1, obj1.bar = 1)
arktest.assertEQ(2, val1);
arktest.assertEQ(2, val2);
arktest.assertEQ(2, obj1.bar);

// Try to redefine bar again - should fail as configurable is false.
arktest.assertFalse(Reflect.defineProperty(obj1, 'bar', accessorConfigurable));

// Try to redefine bar again using the data descriptor - should fail.
arktest.assertFalse(Reflect.defineProperty(obj1, 'bar', dataConfigurable));

// Redefine using same descriptor - should succeed.
arktest.assertTrue(Reflect.defineProperty(obj1, 'bar', accessorNoConfigurable));
desc = Object.getOwnPropertyDescriptor(obj1, 'bar');
arktest.assertFalse(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorNoConfigurable.get);
arktest.assertEQ(desc.set, accessorNoConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj1.bar = 1);
arktest.assertEQ(2, val1);
arktest.assertEQ(3, val2);
arktest.assertEQ(1, obj1.bar = 1)
arktest.assertEQ(2, val1);
arktest.assertEQ(4, val2);
arktest.assertEQ(4, obj1.bar);

// Define an accessor that has only a setter.
arktest.assertTrue(Reflect.defineProperty(obj1, 'setOnly', accessorOnlySet));
desc = Object.getOwnPropertyDescriptor(obj1, 'setOnly');
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.set, accessorOnlySet.set);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(1, obj1.setOnly = 1);
arktest.assertEQ(1, val3);

// Add a getter - should not touch the setter.
arktest.assertTrue(Reflect.defineProperty(obj1, 'setOnly', accessorOnlyGet));
desc = Object.getOwnPropertyDescriptor(obj1, 'setOnly');
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, accessorOnlyGet.get);
arktest.assertEQ(desc.set, accessorOnlySet.set);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj1.setOnly = 1);
arktest.assertEQ(2, val3);

// The above should also work if redefining just a getter or setter on
// an existing property with both a getter and a setter.
arktest.assertTrue(Reflect.defineProperty(obj1, 'both', accessorConfigurable));

arktest.assertTrue(Reflect.defineProperty(obj1, 'both', accessorOnlySet));
desc = Object.getOwnPropertyDescriptor(obj1, 'both');
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.set, accessorOnlySet.set);
arktest.assertEQ(desc.get, accessorConfigurable.get);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj1.both = 1);
arktest.assertEQ(3, val3);


// Data properties

arktest.assertTrue(Reflect.defineProperty(obj1, 'foobar', dataConfigurable));
desc = Object.getOwnPropertyDescriptor(obj1, 'foobar');
arktest.assertEQ(obj1.foobar, 1000);
arktest.assertEQ(desc.value, 1000);
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);
//Try writing to non writable attribute - should remain 1000
obj1.foobar = 1001;
arktest.assertEQ(obj1.foobar, 1000);


// Redefine to writable descriptor - now writing to foobar should be allowed.
arktest.assertTrue(Reflect.defineProperty(obj1, 'foobar', dataWritable));
desc = Object.getOwnPropertyDescriptor(obj1, 'foobar');
arktest.assertEQ(obj1.foobar, 3000);
arktest.assertEQ(desc.value, 3000);
// Note that since dataWritable does not define configurable the configurable
// setting from the redefined property (in this case true) is used.
arktest.assertTrue(desc.configurable);
arktest.assertTrue(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);
// Writing to the property should now be allowed
obj1.foobar = 1001;
arktest.assertEQ(obj1.foobar, 1001);


// Redefine with non configurable data property.
arktest.assertTrue(Reflect.defineProperty(obj1, 'foobar', dataNoConfigurable));
desc = Object.getOwnPropertyDescriptor(obj1, 'foobar');
arktest.assertEQ(obj1.foobar, 2000);
arktest.assertEQ(desc.value, 2000);
arktest.assertFalse(desc.configurable);
arktest.assertTrue(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);

// Try redefine again - shold fail because configurable is now false.
arktest.assertFalse(Reflect.defineProperty(obj1, 'foobar', dataConfigurable));

// Try redefine again with accessor property - shold also fail.
arktest.assertFalse(Reflect.defineProperty(obj1, 'foobar', dataConfigurable));


// Redifine with the same descriptor - should succeed (step 6).
arktest.assertTrue(Reflect.defineProperty(obj1, 'foobar', dataNoConfigurable));
desc = Object.getOwnPropertyDescriptor(obj1, 'foobar');
arktest.assertEQ(obj1.foobar, 2000);
arktest.assertEQ(desc.value, 2000);
arktest.assertFalse(desc.configurable);
arktest.assertTrue(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);


// New object
let obj2 = {};

// Make accessor - redefine to data
arktest.assertTrue(Reflect.defineProperty(obj2, 'foo', accessorConfigurable));

// Redefine to data property
arktest.assertTrue(Reflect.defineProperty(obj2, 'foo', dataConfigurable));
desc = Object.getOwnPropertyDescriptor(obj2, 'foo');
arktest.assertEQ(obj2.foo, 1000);
arktest.assertEQ(desc.value, 1000);
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);


// Redefine back to accessor
arktest.assertTrue(Reflect.defineProperty(obj2, 'foo', accessorConfigurable));
desc = Object.getOwnPropertyDescriptor(obj2, 'foo');
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorConfigurable.get);
arktest.assertEQ(desc.set, accessorConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj2.foo = 1);
arktest.assertEQ(3, val1);
arktest.assertEQ(4, val2);
arktest.assertEQ(3, obj2.foo);

// Make data - redefine to accessor
arktest.assertTrue(Reflect.defineProperty(obj2, 'bar', dataConfigurable))

// Redefine to accessor property
arktest.assertTrue(Reflect.defineProperty(obj2, 'bar', accessorConfigurable));
desc = Object.getOwnPropertyDescriptor(obj2, 'bar');
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorConfigurable.get);
arktest.assertEQ(desc.set, accessorConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj2.bar = 1);
arktest.assertEQ(4, val1);
arktest.assertEQ(4, val2);
arktest.assertEQ(4, obj2.foo);

// Redefine back to data property
arktest.assertTrue(Reflect.defineProperty(obj2, 'bar', dataConfigurable));
desc = Object.getOwnPropertyDescriptor(obj2, 'bar');
arktest.assertEQ(obj2.bar, 1000);
arktest.assertEQ(desc.value, 1000);
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);


// Redefinition of an accessor defined using __defineGetter__ and
// __defineSetter__.
function get(){return this.x}
function set(x){this.x=x};

let obj3 = {x:1000};
obj3.__defineGetter__('foo', get);
obj3.__defineSetter__('foo', set);

desc = Object.getOwnPropertyDescriptor(obj3, 'foo');
arktest.assertTrue(desc.configurable);
arktest.assertTrue(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, get);
arktest.assertEQ(desc.set, set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj3.foo = 1);
arktest.assertEQ(1, obj3.x);
arktest.assertEQ(1, obj3.foo);

// Redefine to accessor property (non configurable) - note that enumerable
// which we do not redefine should remain the same (true).
arktest.assertTrue(Reflect.defineProperty(obj3, 'foo', accessorNoConfigurable));
desc = Object.getOwnPropertyDescriptor(obj3, 'foo');
arktest.assertFalse(desc.configurable);
arktest.assertTrue(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorNoConfigurable.get);
arktest.assertEQ(desc.set, accessorNoConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj3.foo = 1);
arktest.assertEQ(5, val2);
arktest.assertEQ(5, obj3.foo);


obj3.__defineGetter__('bar', get);
obj3.__defineSetter__('bar', set);


// Redefine back to data property
arktest.assertTrue(Reflect.defineProperty(obj3, 'bar', dataConfigurable));
desc = Object.getOwnPropertyDescriptor(obj3, 'bar');
arktest.assertEQ(obj3.bar, 1000);
arktest.assertEQ(desc.value, 1000);
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertEQ(desc.get, undefined);
arktest.assertEQ(desc.set, undefined);


const obj4 = {};
let func = function (){return 42;};
obj4.bar = func;
arktest.assertEQ(42, obj4.bar());

arktest.assertTrue(Reflect.defineProperty(obj4, 'bar', accessorConfigurable));
desc = Object.getOwnPropertyDescriptor(obj4, 'bar');
arktest.assertTrue(desc.configurable);
arktest.assertTrue(desc.enumerable);
arktest.assertEQ(desc.writable, undefined);
arktest.assertEQ(desc.get, accessorConfigurable.get);
arktest.assertEQ(desc.set, accessorConfigurable.set);
arktest.assertEQ(desc.value, undefined);
arktest.assertEQ(1, obj4.bar = 1);
arktest.assertEQ(5, val1);
arktest.assertEQ(5, obj4.bar);

// Make sure an error is thrown when trying to access to redefined function.
try {
  obj4.bar();
  arktest.assertTrue(false);
} catch (e) {
  arktest.assertTrue(/is not a function/.test(e));
}


// Test that all possible differences in step 6 in DefineOwnProperty are
// exercised, i.e., any difference in the given property descriptor and the
// existing properties should not return true, but throw an error if the
// existing configurable property is false.

const obj5 = {};
// Enumerable will default to false.
arktest.assertTrue(Reflect.defineProperty(obj5, 'foo', accessorNoConfigurable));
desc = Object.getOwnPropertyDescriptor(obj5, 'foo');
// First, test that we are actually allowed to set the accessor if all
// values are of the descriptor are the same as the existing one.
arktest.assertTrue(Reflect.defineProperty(obj5, 'foo', accessorNoConfigurable));

// Different setter.
let descDifferent = {
  configurable:false,
  enumerable:false,
  set: setter1,
  get: getter2
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'foo', descDifferent));

// Different getter.
descDifferent = {
  configurable:false,
  enumerable:false,
  set: setter2,
  get: getter1
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'foo', descDifferent));

// Different enumerable.
descDifferent = {
  configurable:false,
  enumerable:true,
  set: setter2,
  get: getter2
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'foo', descDifferent));

// Different configurable.
descDifferent = {
  configurable:false,
  enumerable:true,
  set: setter2,
  get: getter2
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'foo', descDifferent));

// No difference.
descDifferent = {
  configurable:false,
  enumerable:false,
  set: setter2,
  get: getter2
};
// Make sure we can still redefine if all properties are the same.
arktest.assertTrue(Reflect.defineProperty(obj5, 'foo', descDifferent));

// Make sure that obj5 still holds the original values.
desc = Object.getOwnPropertyDescriptor(obj5, 'foo');
arktest.assertEQ(desc.get, getter2);
arktest.assertEQ(desc.set, setter2);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.configurable);


// Also exercise step 6 on data property, writable and enumerable
// defaults to false.
arktest.assertTrue(Reflect.defineProperty(obj5, 'bar', dataNoConfigurable));

// Test that redefinition with the same property descriptor is possible
arktest.assertTrue(Reflect.defineProperty(obj5, 'bar', dataNoConfigurable));

// Different value.
descDifferent = {
  configurable:false,
  enumerable:false,
  writable: false,
  value: 1999
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'bar', descDifferent));

// Different writable.
descDifferent = {
  configurable:false,
  enumerable:false,
  writable: true,
  value: 2000
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'bar', descDifferent));


// Different enumerable.
descDifferent = {
  configurable:false,
  enumerable:true ,
  writable:false,
  value: 2000
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'bar', descDifferent));


// Different configurable.
descDifferent = {
  configurable:true,
  enumerable:false,
  writable:false,
  value: 2000
};

arktest.assertFalse(Reflect.defineProperty(obj5, 'bar', descDifferent));

// No difference.
descDifferent = {
  configurable:false,
  enumerable:false,
  writable:false,
  value:2000
};
// Make sure we can still redefine if all properties are the same.
arktest.assertTrue(Reflect.defineProperty(obj5, 'bar', descDifferent));

// Make sure that obj5 still holds the original values.
desc = Object.getOwnPropertyDescriptor(obj5, 'bar');
arktest.assertEQ(desc.value, 2000);
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.configurable);


// Make sure that we can't overwrite +0 with -0 and vice versa.
const descMinusZero = {value: -0, configurable: false};
const descPlusZero = {value: +0, configurable: false};

arktest.assertTrue(Reflect.defineProperty(obj5, 'minuszero', descMinusZero));

// Make sure we can redefine with -0.
arktest.assertTrue(Reflect.defineProperty(obj5, 'minuszero', descMinusZero));

arktest.assertFalse(Reflect.defineProperty(obj5, 'minuszero', descPlusZero));


arktest.assertTrue(Reflect.defineProperty(obj5, 'pluszero', descPlusZero));

// Make sure we can redefine with +0.
arktest.assertTrue(Reflect.defineProperty(obj5, 'pluszero', descPlusZero));

arktest.assertFalse(Reflect.defineProperty(obj5, 'pluszero', descMinusZero));


const obj6 = {};
obj6[1] = 'foo';
obj6[2] = 'bar';
obj6[3] = '42';
obj6[4] = '43';
obj6[5] = '44';

let descElement = { value: 'foobar' };
let descElementNonConfigurable = { value: 'barfoo', configurable: false };
let descElementNonWritable = { value: 'foofoo', writable: false };
let descElementNonEnumerable = { value: 'barbar', enumerable: false };
let descElementAllFalse = { value: 'foofalse',
                            configurable: false,
                            writable: false,
                            enumerable: false };


// Redefine existing property.
arktest.assertTrue(Reflect.defineProperty(obj6, '1', descElement));
desc = Object.getOwnPropertyDescriptor(obj6, '1');
arktest.assertEQ(desc.value, 'foobar');
arktest.assertTrue(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertTrue(desc.configurable);

// Redefine existing property with configurable: false.
arktest.assertTrue(Reflect.defineProperty(obj6, '2', descElementNonConfigurable));
desc = Object.getOwnPropertyDescriptor(obj6, '2');
arktest.assertEQ(desc.value, 'barfoo');
arktest.assertTrue(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertFalse(desc.configurable);

// Can use defineProperty to change the value of a non
// configurable property.
try {
  arktest.assertTrue(Reflect.defineProperty(obj6, '2', descElement));
  desc = Object.getOwnPropertyDescriptor(obj6, '2');
  arktest.assertEQ(desc.value, 'foobar');
} catch (e) {
  arktest.assertTrue(false);
}

// Ensure that we can't change the descriptor of a
// non configurable property.
let descAccessor = { get: function() { return 0; } };
arktest.assertFalse(Reflect.defineProperty(obj6, '2', descAccessor));

arktest.assertTrue(Reflect.defineProperty(obj6, '2', descElementNonWritable));
desc = Object.getOwnPropertyDescriptor(obj6, '2');
arktest.assertEQ(desc.value, 'foofoo');
arktest.assertFalse(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertFalse(desc.configurable);

arktest.assertTrue(Reflect.defineProperty(obj6, '3', descElementNonWritable));
desc = Object.getOwnPropertyDescriptor(obj6, '3');
arktest.assertEQ(desc.value, 'foofoo');
arktest.assertFalse(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertTrue(desc.configurable);

// Redefine existing property with configurable: false.
arktest.assertTrue(Reflect.defineProperty(obj6, '4', descElementNonEnumerable));
desc = Object.getOwnPropertyDescriptor(obj6, '4');
arktest.assertEQ(desc.value, 'barbar');
arktest.assertTrue(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertTrue(desc.configurable);

// Redefine existing property with configurable: false.
arktest.assertTrue(Reflect.defineProperty(obj6, '5', descElementAllFalse));
desc = Object.getOwnPropertyDescriptor(obj6, '5');
arktest.assertEQ(desc.value, 'foofalse');
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.configurable);

// Define non existing property - all attributes should default to false.
arktest.assertTrue(Reflect.defineProperty(obj6, '15', descElement));
desc = Object.getOwnPropertyDescriptor(obj6, '15');
arktest.assertEQ(desc.value, 'foobar');
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.configurable);

// Make sure that we can't redefine using direct access.
obj6[15] ='overwrite';
arktest.assertEQ(obj6[15],'foobar');


// Repeat the above tests on an array.
const arr = [];
arr[1] = 'foo';
arr[2] = 'bar';
arr[3] = '42';
arr[4] = '43';
arr[5] = '44';

let descElement = { value: 'foobar' };
let descElementNonConfigurable = { value: 'barfoo', configurable: false };
let descElementNonWritable = { value: 'foofoo', writable: false };
let descElementNonEnumerable = { value: 'barbar', enumerable: false };
let descElementAllFalse = { value: 'foofalse',
                            configurable: false,
                            writable: false,
                            enumerable: false };


// Redefine existing property.
arktest.assertTrue(Reflect.defineProperty(arr, '1', descElement));
desc = Object.getOwnPropertyDescriptor(arr, '1');
arktest.assertEQ(desc.value, 'foobar');
arktest.assertTrue(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertTrue(desc.configurable);

// Redefine existing property with configurable: false.
arktest.assertTrue(Reflect.defineProperty(arr, '2', descElementNonConfigurable));
desc = Object.getOwnPropertyDescriptor(arr, '2');
arktest.assertEQ(desc.value, 'barfoo');
arktest.assertTrue(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertFalse(desc.configurable);

// Can use defineProperty to change the value of a non
// configurable property of an array.
try {
  arktest.assertTrue(Reflect.defineProperty(arr, '2', descElement));
  desc = Object.getOwnPropertyDescriptor(arr, '2');
  arktest.assertEQ(desc.value, 'foobar');
} catch (e) {
  arktest.assertTrue(false);
}

// Ensure that we can't change the descriptor of a
// non configurable property.
let descAccessor = { get: function() { return 0; } };
arktest.assertFalse(Reflect.defineProperty(arr, '2', descAccessor));

arktest.assertTrue(Reflect.defineProperty(arr, '2', descElementNonWritable));
desc = Object.getOwnPropertyDescriptor(arr, '2');
arktest.assertEQ(desc.value, 'foofoo');
arktest.assertFalse(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertFalse(desc.configurable);

arktest.assertTrue(Reflect.defineProperty(arr, '3', descElementNonWritable));
desc = Object.getOwnPropertyDescriptor(arr, '3');
arktest.assertEQ(desc.value, 'foofoo');
arktest.assertFalse(desc.writable);
arktest.assertTrue(desc.enumerable);
arktest.assertTrue(desc.configurable);

// Redefine existing property with configurable: false.
arktest.assertTrue(Reflect.defineProperty(arr, '4', descElementNonEnumerable));
desc = Object.getOwnPropertyDescriptor(arr, '4');
arktest.assertEQ(desc.value, 'barbar');
arktest.assertTrue(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertTrue(desc.configurable);

// Redefine existing property with configurable: false.
arktest.assertTrue(Reflect.defineProperty(arr, '5', descElementAllFalse));
desc = Object.getOwnPropertyDescriptor(arr, '5');
arktest.assertEQ(desc.value, 'foofalse');
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.configurable);

// Define non existing property - all attributes should default to false.
arktest.assertTrue(Reflect.defineProperty(arr, '15', descElement));
desc = Object.getOwnPropertyDescriptor(arr, '15');
arktest.assertEQ(desc.value, 'foobar');
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.enumerable);
arktest.assertFalse(desc.configurable);

// Define non-array property, check that .length is unaffected.
arktest.assertEQ(16, arr.length);
arktest.assertTrue(Reflect.defineProperty(arr, '0x20', descElement));
arktest.assertEQ(16, arr.length);

let o = { x : 42 };
arktest.assertTrue(Reflect.defineProperty(o, 'x', { writable: false }));
arktest.assertEQ(42, o.x);
o.x = 37;
arktest.assertEQ(42, o.x);

o = { x : 42 };
arktest.assertTrue(Reflect.defineProperty(o, 'x', {}));
arktest.assertEQ(42, o.x);
o.x = 37;
// Writability is preserved.
arktest.assertEQ(37, o.x);

let o = { };
arktest.assertTrue(Reflect.defineProperty(o, 'x', { writable: false }));
arktest.assertEQ(undefined, o.x);
o.x = 37;
arktest.assertEQ(undefined, o.x);

o = { get x() { return 87; } };
arktest.assertTrue(Reflect.defineProperty(o, 'x', { writable: false }));
arktest.assertEQ(undefined, o.x);
o.x = 37;
arktest.assertEQ(undefined, o.x);

// Ignore inherited properties.
o = { __proto__ : { x : 87 } };
arktest.assertTrue(Reflect.defineProperty(o, 'x', { writable: false }));
arktest.assertEQ(undefined, o.x);
o.x = 37;
arktest.assertEQ(undefined, o.x);

function testDefineProperty(obj, propertyName, desc, resultDesc) {
  arktest.assertTrue(Reflect.defineProperty(obj, propertyName, desc));
  const actualDesc = Object.getOwnPropertyDescriptor(obj, propertyName);
  arktest.assertEQ(resultDesc.enumerable, actualDesc.enumerable);
  arktest.assertEQ(resultDesc.configurable, actualDesc.configurable);
  if (resultDesc.hasOwnProperty('value')) {
    arktest.assertEQ(resultDesc.value, actualDesc.value);
    arktest.assertEQ(resultDesc.writable, actualDesc.writable);
    arktest.assertFalse(resultDesc.hasOwnProperty('get'));
    arktest.assertFalse(resultDesc.hasOwnProperty('set'));
  } else {
    arktest.assertEQ(resultDesc.get, actualDesc.get);
    arktest.assertEQ(resultDesc.set, actualDesc.set);
    arktest.assertFalse(resultDesc.hasOwnProperty('value'));
    arktest.assertFalse(resultDesc.hasOwnProperty('writable'));
  }
}

// tests redefining existing property with a generic descriptor
o = { p : 42 };
testDefineProperty(o, 'p',
  { },
  { value : 42, writable : true, enumerable : true, configurable : true });

o = { p : 42 };
testDefineProperty(o, 'p',
  { enumerable : true },
  { value : 42, writable : true, enumerable : true, configurable : true });

o = { p : 42 };
testDefineProperty(o, 'p',
  { configurable : true },
  { value : 42, writable : true, enumerable : true, configurable : true });

o = { p : 42 };
testDefineProperty(o, 'p',
  { enumerable : false },
  { value : 42, writable : true, enumerable : false, configurable : true });

o = { p : 42 };
testDefineProperty(o, 'p',
  { configurable : false },
  { value : 42, writable : true, enumerable : true, configurable : false });

o = { p : 42 };
testDefineProperty(o, 'p',
  { enumerable : true, configurable : true },
  { value : 42, writable : true, enumerable : true, configurable : true });

o = { p : 42 };
testDefineProperty(o, 'p',
  { enumerable : false, configurable : true },
  { value : 42, writable : true, enumerable : false, configurable : true });

o = { p : 42 };
testDefineProperty(o, 'p',
  { enumerable : true, configurable : false },
  { value : 42, writable : true, enumerable : true, configurable : false });

o = { p : 42 };
testDefineProperty(o, 'p',
  { enumerable : false, configurable : false },
  { value : 42, writable : true, enumerable : false, configurable : false });

// can make a writable, non-configurable field non-writable
o = { p : 42 };
arktest.assertTrue(Reflect.defineProperty(o, 'p', { configurable: false }));
testDefineProperty(o, 'p',
  { writable: false },
  { value : 42, writable : false, enumerable : true, configurable : false });

// redefine of get only property with generic descriptor
o = {};
arktest.assertTrue(Reflect.defineProperty(o, 'p',
  { get : getter1, enumerable: true, configurable: true }));
testDefineProperty(o, 'p',
  { enumerable : false, configurable : false },
  { get: getter1, set: undefined, enumerable : false, configurable : false });

// redefine of get/set only property with generic descriptor
o = {};
arktest.assertTrue(Reflect.defineProperty(o, 'p',
  { get: getter1, set: setter1, enumerable: true, configurable: true }));
testDefineProperty(o, 'p',
  { enumerable : false, configurable : false },
  { get: getter1, set: setter1, enumerable : false, configurable : false });

// redefine of set only property with generic descriptor
o = {};
arktest.assertTrue(Reflect.defineProperty(o, 'p',
  { set : setter1, enumerable: true, configurable: true }));
testDefineProperty(o, 'p',
  { enumerable : false, configurable : false },
  { get: undefined, set: setter1, enumerable : false, configurable : false });


// Regression test: Ensure that growing dictionaries are not ignored.
o = {};
for (let i = 0; i < 1000; i++) {
  // Non-enumerable property forces dictionary mode.
  arktest.assertTrue(Reflect.defineProperty(o, i, {value: i, enumerable: false}));
}
arktest.assertEQ(999, o[999]);


// Regression test: Bizarre behavior on non-strict arguments object.

// Regression test: We should never observe the hole value.
const objectWithGetter = {};
objectWithGetter.__defineGetter__('foo', function() {});
arktest.assertEQ(undefined, objectWithGetter.__lookupSetter__('foo'));

const objectWithSetter = {};
objectWithSetter.__defineSetter__('foo', function(x) {});
arktest.assertEQ(undefined, objectWithSetter.__lookupGetter__('foo'));

// An object with a getter on the prototype chain.
function getter() { return 111; }
function anotherGetter() { return 222; }

function testGetterOnProto(expected, o) {
  arktest.assertEQ(expected, o.quebec);
}

obj1 = {};
arktest.assertTrue(
  Reflect.defineProperty(obj1, 'quebec', { get: getter, configurable: true }));
obj2 = Object.create(obj1);
obj3 = Object.create(obj2);

ArkTools.prepareFunctionForOptimization(testGetterOnProto);
testGetterOnProto(111, obj3);
testGetterOnProto(111, obj3);
ArkTools.optimizeFunctionOnNextCall(testGetterOnProto);
testGetterOnProto(111, obj3);
testGetterOnProto(111, obj3);

arktest.assertTrue(Reflect.defineProperty(obj1, 'quebec', { get: anotherGetter }));

ArkTools.prepareFunctionForOptimization(testGetterOnProto);
testGetterOnProto(222, obj3);
testGetterOnProto(222, obj3);
ArkTools.optimizeFunctionOnNextCall(testGetterOnProto);
testGetterOnProto(222, obj3);
testGetterOnProto(222, obj3);

// An object with a setter on the prototype chain.
let modifyMe;
function setter(x) { modifyMe = x+1; }
function anotherSetter(x) { modifyMe = x+2; }

function testSetterOnProto(expected, o) {
  modifyMe = 333;
  o.romeo = 444;
  arktest.assertEQ(expected, modifyMe);
}

obj1 = {};
arktest.assertTrue(
  Reflect.defineProperty(obj1, 'romeo', { set: setter, configurable: true }));
obj2 = Object.create(obj1);
obj3 = Object.create(obj2);

ArkTools.prepareFunctionForOptimization(testSetterOnProto);
testSetterOnProto(445, obj3);
testSetterOnProto(445, obj3);
ArkTools.optimizeFunctionOnNextCall(testSetterOnProto);
testSetterOnProto(445, obj3);
testSetterOnProto(445, obj3);

arktest.assertTrue(Reflect.defineProperty(obj1, 'romeo', { set: anotherSetter }));

ArkTools.prepareFunctionForOptimization(testSetterOnProto);
testSetterOnProto(446, obj3);
testSetterOnProto(446, obj3);
ArkTools.optimizeFunctionOnNextCall(testSetterOnProto);
testSetterOnProto(446, obj3);
testSetterOnProto(446, obj3);

// Removing a setter on the prototype chain.
function testSetterOnProtoStrict(o) {
  'use strict';
  o.sierra = 12345;
}

obj1 = {};
arktest.assertTrue(Reflect.defineProperty(obj1, 'sierra',
                      { get: getter, set: setter, configurable: true }));
obj2 = Object.create(obj1);
obj3 = Object.create(obj2);

ArkTools.prepareFunctionForOptimization(testSetterOnProtoStrict);
testSetterOnProtoStrict(obj3);
testSetterOnProtoStrict(obj3);
ArkTools.optimizeFunctionOnNextCall(testSetterOnProtoStrict);
testSetterOnProtoStrict(obj3);
testSetterOnProtoStrict(obj3);

arktest.assertTrue(Reflect.defineProperty(obj1, 'sierra',
                      { get: getter, set: undefined, configurable: true }));

exception = false;
try {
  testSetterOnProtoStrict(obj3);
} catch (e) {
  exception = true;
  arktest.assertTrue(/which has only a getter/.test(e));
}
arktest.assertTrue(exception);

// Test assignment to a getter-only property on the prototype chain. This makes
// sure that crankshaft re-checks its assumptions and doesn't rely only on type
// feedback (which would be monomorphic here).

function assign(o) {
  o.blubb = 123;
}

function C() {}

ArkTools.prepareFunctionForOptimization(assign);
assign(new C);
assign(new C);
ArkTools.optimizeFunctionOnNextCall(assign);
arktest.assertTrue(
  Reflect.defineProperty(C.prototype, 'blubb', {get: function() {return -42}}));
assign(new C);

// Test that changes to the prototype of a simple constructor are not ignored,
// even after creating initial instances.
function C() {
  this.x = 23;
}
arktest.assertEQ(23, new C().x);
C.prototype.__defineSetter__('x', function(value) { this.y = 23; });
arktest.assertEQ(void 0, new C().x);
