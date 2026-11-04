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

function toKey(x) {
  if (typeof x === 'symbol') { return x; }
  return String(x);
}


const noconf = {configurable: false};
const noconfNowrite = {configurable: false, writable: false};


const symbol = Symbol();


const log = [];
const logger = {};
const handler = new Proxy({}, logger);

logger.get = function(t, trap, r) {
  return function() {
    log.push([trap, ...arguments]);
    return Reflect[trap](...arguments);
  }
};


(function Seal() {
  let target = [];
  let proxy = new Proxy(target, handler);
  log.length = 0;

  target.wurst = 42;
  target[0] = true;
  Object.defineProperty(target, symbol, {get: undefined});

  Object.seal(proxy);
  arktest.assertEQ(6, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['preventExtensions', target], log[0]);
  arktest.assertEQ(
      ['ownKeys', target], log[1]);
  arktest.assertEQ(
      ['defineProperty', target, toKey(0), noconf], log[2]);
  arktest.assertEQ(
      ['defineProperty', target, toKey('length'), noconf], log[3]);
  arktest.assertEQ(
      ['defineProperty', target, toKey('wurst'), noconf], log[4]);
  arktest.assertEQ(
      ['defineProperty', target, toKey(symbol), noconf], log[5]);
})();


(function Freeze() {
  let target = [];
  let proxy = new Proxy(target, handler);
  log.length = 0;

  target.wurst = 42;
  target[0] = true;
  Object.defineProperty(target, symbol, {get: undefined});

  Object.freeze(proxy);
  arktest.assertEQ(10, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['preventExtensions', target], log[0]);
  arktest.assertEQ(
      ['ownKeys', target], log[1]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(0)], log[2]);
  arktest.assertEQ(
      ['defineProperty', target, toKey(0), noconfNowrite], log[3]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey('length')], log[4]);
  arktest.assertEQ(
      ['defineProperty', target, toKey('length'), noconfNowrite], log[5]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey('wurst')], log[6]);
  arktest.assertEQ(
      ['defineProperty', target, toKey('wurst'), noconfNowrite], log[7]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(symbol)], log[8]);
  arktest.assertEQ(
      ['defineProperty', target, toKey(symbol), noconf], log[9]);
})();


(function IsSealed() {
  let target = [];
  let proxy = new Proxy(target, handler);

  target.wurst = 42;
  target[0] = true;
  Object.defineProperty(target, symbol, {get: undefined});

  // Extensible.

  log.length = 0;

  Object.isSealed(proxy);
  arktest.assertEQ(1, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['isExtensible', target], log[0]);

  // Not extensible but not sealed.

  log.length = 0;
  Object.preventExtensions(target);

  Object.isSealed(proxy);
  arktest.assertEQ(3, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['isExtensible', target], log[0]);
  arktest.assertEQ(
      ['ownKeys', target], log[1]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(0)], log[2]);

  // Sealed.

  log.length = 0;
  Object.seal(target);

  Object.isSealed(proxy);
  arktest.assertEQ(6, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['isExtensible', target], log[0]);
  arktest.assertEQ(
      ['ownKeys', target], log[1]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(0)], log[2]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey('length')], log[3]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey('wurst')], log[4]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(symbol)], log[5]);
})();


(function IsFrozen() {
  let target = [];
  let proxy = new Proxy(target, handler);

  target.wurst = 42;
  target[0] = true;
  Object.defineProperty(target, symbol, {get: undefined});

  // Extensible.

  log.length = 0;

  Object.isFrozen(proxy);
  arktest.assertEQ(1, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['isExtensible', target], log[0]);

  // Not extensible but not frozen.

  log.length = 0;
  Object.preventExtensions(target);

  Object.isFrozen(proxy);
  arktest.assertEQ(3, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['isExtensible', target], log[0]);
  arktest.assertEQ(
      ['ownKeys', target], log[1]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(0)], log[2]);

  // Frozen.

  log.length = 0;
  Object.freeze(target);

  Object.isFrozen(proxy);
  arktest.assertEQ(6, log.length)
  log.forEach((_, arrayIndex) => {
    let i = arrayIndex.toString();
    arktest.assertEQ(target, log[i][1]);
  });

  arktest.assertEQ(
      ['isExtensible', target], log[0]);
  arktest.assertEQ(
      ['ownKeys', target], log[1]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(0)], log[2]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey('length')], log[3]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey('wurst')], log[4]);
  arktest.assertEQ(
      ['getOwnPropertyDescriptor', target, toKey(symbol)], log[5]);
})();
