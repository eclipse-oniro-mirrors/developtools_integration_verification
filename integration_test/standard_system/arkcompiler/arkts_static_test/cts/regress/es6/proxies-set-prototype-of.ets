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
expected_out_1: >-
  Semantic error ESE0174: Cannot infer type for target because class composite
  needs an explicit target type
---*/

let target = { target: 1 };
target.__proto__ = {};
let handler = { handler: 1 };
const proxy = new Proxy(target, handler);

arktest.assertEQ(Object.getPrototypeOf(proxy), target.__proto__ );


arktest.expectThrow(
  function() { Object.setPrototypeOf(proxy, undefined) },
  ((e: Error): boolean => e instanceof TypeError)
);
arktest.expectThrow(function() { Object.setPrototypeOf(proxy, 1) }, ((e: Error): boolean => e instanceof TypeError));

let prototype = [1];
arktest.assertEQ(proxy, Object.setPrototypeOf(proxy, prototype));
arktest.assertEQ(prototype, Object.getPrototypeOf(proxy));
arktest.assertEQ(prototype, Object.getPrototypeOf(target));

const pair = Proxy.revocable(target, handler);
arktest.assertEQ(pair.proxy, Object.setPrototypeOf(pair.proxy, prototype));
arktest.assertEQ(prototype, Object.getPrototypeOf(pair.proxy));
pair.revoke();
arktest.expectThrow('Object.setPrototypeOf(pair.proxy, prototype)', ((e: Error): boolean => e instanceof TypeError));

handler.setPrototypeOf = function(target, proto) {
  return false;
};
arktest.expectThrow(
  function() { Object.setPrototypeOf(proxy, {a:1}) },
  ((e: Error): boolean => e instanceof TypeError)
);

handler.setPrototypeOf = function(target, proto) {
  return undefined;
};
arktest.expectThrow(
  function() { Object.setPrototypeOf(proxy, {a:2}) },
  ((e: Error): boolean => e instanceof TypeError)
);

handler.setPrototypeOf = function(proto) {};
arktest.expectThrow(
  function() { Object.setPrototypeOf(proxy, {a:3}) },
  ((e: Error): boolean => e instanceof TypeError)
);

handler.setPrototypeOf = function(target, proto) {
  throw Error();
};
arktest.expectThrow(function() { Object.setPrototypeOf(proxy, {a:4}) }, ((e: Error): boolean => e instanceof Error));

let seenPrototype;
let seenTarget;
handler.setPrototypeOf = function(target, proto) {
  seenTarget = target;
  seenPrototype = proto;
  return true;
}
arktest.assertEQ(Object.setPrototypeOf(proxy, {a:5}), proxy);
arktest.assertEQ(target, seenTarget);
arktest.assertEQ({a:5}, seenPrototype);

(function setPrototypeProxyTarget() {
  let target = { target: 1 };
  target.__proto__ = {};
  let handler = {};
  let handler2 = {};
  let target2 = new Proxy(target, handler2);
  let proxy2 = new Proxy(target2, handler);
  arktest.assertEQ(Object.getPrototypeOf(proxy2), target.__proto__ );

  let prototype = [2,3];
  arktest.assertEQ(proxy2, Object.setPrototypeOf(proxy2, prototype));
  arktest.assertEQ(prototype, Object.getPrototypeOf(proxy2));
  arktest.assertEQ(prototype, Object.getPrototypeOf(target));
})();

(function testProxyTrapInconsistent() {
  let target = { target: 1 };
  target.__proto__ = {};
  let handler = {};
  let handler2 = {
  };

  let target2 = new Proxy(target, handler);
  let proxy2 = new Proxy(target2, handler2);

  // If the final target is extensible we can set any prototype.
  let prototype = [1];
  Reflect.setPrototypeOf(proxy2, prototype);
  arktest.assertEQ(prototype, Reflect.getPrototypeOf(target));

  handler2.setPrototypeOf = function(target, value) {
    Reflect.setPrototypeOf(target, value);
    return true;
  };
  prototype = [2];
  Reflect.setPrototypeOf(proxy2, prototype);
  arktest.assertEQ(prototype, Reflect.getPrototypeOf(target));

  // Prevent getting the target's prototype used to check the invariant.
  let gotPrototype = false;
  handler.getPrototypeOf = function() {
    gotPrototype = true;
    throw TypeError()
  };
  // If the target is extensible we do not check the invariant.
  prototype = [3];
  Reflect.setPrototypeOf(proxy2, prototype);
  arktest.assertFalse(gotPrototype);
  arktest.assertEQ(prototype, Reflect.getPrototypeOf(target));

  // Changing the prototype of a non-extensible target will trigger the
  // invariant-check and throw in the above handler.
  Reflect.preventExtensions(target);
  arktest.expectThrow(() => {Reflect.setPrototypeOf(proxy2, [4])}, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertTrue(gotPrototype);
  arktest.assertEQ([3], Reflect.getPrototypeOf(target));

  // Setting the prototype of a non-extensible target is fine if the prototype
  // doesn't change.
  delete handler.getPrototypeOf;
  Reflect.setPrototypeOf(proxy2, prototype);
  // Changing the prototype will throw.
  prototype = [5];
  arktest.expectThrow(
    () => {Reflect.setPrototypeOf(proxy2, prototype)},
    ((e: Error): boolean => e instanceof TypeError)
  );
})();

(function testProxyTrapReturnsFalse() {
  let handler = {};
  handler.setPrototypeOf = () => false;
  let target = new Proxy({}, {isExtensible: () => arktest.assertTrue(false)});
  const object = new Proxy(target, handler);
  arktest.assertFalse(Reflect.setPrototypeOf(object, {}));
})();
