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
expected_out_1: "Semantic error ESE0087: Property 'getOwnPropertyDescriptor' does not exist on type 'Object'"
---*/

Object.getOwnPropertyDescriptor(() => {}, 'prototype');

// Test the ES2015 @@species feature

'use strict';

// Subclasses of Array construct themselves under map, etc

class MyArray extends Array { }

arktest.assertEQ(MyArray, new MyArray().map(()=>{}).constructor);
arktest.assertEQ(MyArray, new MyArray().filter(()=>{}).constructor);
arktest.assertEQ(MyArray, new MyArray().slice().constructor);
arktest.assertEQ(MyArray, new MyArray().splice().constructor);
arktest.assertEQ(MyArray, new MyArray().concat([1]).constructor);
arktest.assertEQ(1, new MyArray().concat([1])[0]);

// Subclasses can override @@species to return the another class

class MyOtherArray extends Array {
  static get [Symbol.species]() { return MyArray; }
}

arktest.assertEQ(MyArray, new MyOtherArray().map(()=>{}).constructor);
arktest.assertEQ(MyArray, new MyOtherArray().filter(()=>{}).constructor);
arktest.assertEQ(MyArray, new MyOtherArray().slice().constructor);
arktest.assertEQ(MyArray, new MyOtherArray().splice().constructor);
arktest.assertEQ(MyArray, new MyOtherArray().concat().constructor);

// Array  methods on non-arrays return arrays

class MyNonArray extends Array {
  static get [Symbol.species]() { return MyObject; }
}

class MyObject { }

arktest.assertEQ(MyObject,
             Array.prototype.map.call(new MyNonArray(), ()=>{}).constructor);
arktest.assertEQ(MyObject,
             Array.prototype.filter.call(new MyNonArray(), ()=>{}).constructor);
arktest.assertEQ(MyObject,
             Array.prototype.slice.call(new MyNonArray()).constructor);
arktest.assertEQ(MyObject,
             Array.prototype.splice.call(new MyNonArray()).constructor);
arktest.assertEQ(MyObject,
             Array.prototype.concat.call(new MyNonArray()).constructor);

arktest.assertEQ(undefined,
             Array.prototype.map.call(new MyNonArray(), ()=>{}).length);
arktest.assertEQ(undefined,
             Array.prototype.filter.call(new MyNonArray(), ()=>{}).length);
// slice, splice, and concat actually do explicitly define the length.
arktest.assertEQ(0, Array.prototype.slice.call(new MyNonArray()).length);
arktest.assertEQ(0, Array.prototype.splice.call(new MyNonArray()).length);
arktest.assertEQ(1, Array.prototype.concat.call(new MyNonArray(), ()=>{}).length);

// Cross-realm Arrays build same-realm arrays

const realm = Realm.create();
arktest.assertEQ(Array,
             Array.prototype.map.call(
                 Realm.eval(realm, '[]'), ()=>{}).constructor);
arktest.assertFalse(Array === Realm.eval(realm, '[]').map(()=>{}).constructor);
arktest.assertFalse(Array === Realm.eval(realm, '[].map(()=>{}).constructor'));
arktest.assertEQ(Array,
             Array.prototype.concat.call(
                 Realm.eval(realm, '[]')).constructor);

// Defaults when constructor or @@species is missing or non-constructor

class MyDefaultArray extends Array {
  static get [Symbol.species]() { return undefined; }
}
arktest.assertEQ(Array, new MyDefaultArray().map(()=>{}).constructor);

class MyOtherDefaultArray extends Array { }
arktest.assertEQ(MyOtherDefaultArray,
             new MyOtherDefaultArray().map(()=>{}).constructor);
MyOtherDefaultArray.prototype.constructor = undefined;
arktest.assertEQ(Array, new MyOtherDefaultArray().map(()=>{}).constructor);
arktest.assertEQ(Array, new MyOtherDefaultArray().concat().constructor);

// Exceptions propagated when getting constructor @@species throws

class SpeciesError extends Error { }
class ConstructorError extends Error { }
class MyThrowingArray extends Array {
  static get [Symbol.species]() { throw new SpeciesError; }
}
arktest.expectThrow(() => new MyThrowingArray().map(()=>{}), SpeciesError);
Object.defineProperty(MyThrowingArray.prototype, 'constructor', {
    get() { throw new ConstructorError; }
});
arktest.expectThrow(() => new MyThrowingArray().map(()=>{}), ConstructorError);

// Previously unexpected errors from setting properties in arrays throw

class FrozenArray extends Array {
  constructor(...args) {
    super(...args);
    Object.freeze(this);
  }
}
arktest.expectThrow(() => new FrozenArray([1]).map(()=>0), ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(() => new FrozenArray([1]).filter(()=>true), ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(() => new FrozenArray([1]).slice(0, 1), ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(() => new FrozenArray([1]).splice(0, 1), ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(() => new FrozenArray([]).concat([1]), ((e: Error): boolean => e instanceof TypeError));

// Verify call counts and constructor parameters

let count;
let params;
class MyObservedArray extends Array {
  constructor(...args) {
    super(...args);
    params = args;
  }
  static get [Symbol.species]() {
    count++
    return this;
  }
}

count = 0;
params = undefined;
arktest.assertEQ(MyObservedArray,
             new MyObservedArray().map(()=>{}).constructor);
arktest.assertEQ(1, count);
arktest.assertEQ([0], params);

count = 0;
params = undefined;
arktest.assertEQ(MyObservedArray,
             new MyObservedArray().filter(()=>{}).constructor);
arktest.assertEQ(1, count);
arktest.assertEQ([0], params);

count = 0;
params = undefined;
arktest.assertEQ(MyObservedArray,
             new MyObservedArray().concat().constructor);
arktest.assertEQ(1, count);
arktest.assertEQ([0], params);

count = 0;
params = undefined;
arktest.assertEQ(MyObservedArray,
             new MyObservedArray().slice().constructor);
arktest.assertEQ(1, count);
arktest.assertEQ([0], params);

count = 0;
params = undefined;
arktest.assertEQ(MyObservedArray,
             new MyObservedArray().splice().constructor);
arktest.assertEQ(1, count);
arktest.assertEQ([0], params);

// @@species constructor can be a Proxy, and the realm access doesn't
// crash

class MyProxyArray extends Array { }
let proxyArray = new Proxy(MyProxyArray, {});
MyProxyArray.constructor = proxyArray;

arktest.assertEQ(MyProxyArray, new proxyArray().map(()=>{}).constructor);
