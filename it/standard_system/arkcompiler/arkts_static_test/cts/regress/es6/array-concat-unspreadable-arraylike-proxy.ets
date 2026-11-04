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
expected_out_1: "Semantic error ESE0371: Cannot find type 'Proxy'."
---*/

let proxy = new Proxy([], {});

// Note: concat does not currently support species so there is no difference
// between [].concat(foo) and Array.prototype.concat.apply(foo).

let log = [];
let logger = {};
let handler = new Proxy({}, logger);

logger.get = function(t, trap, r) {
  return function(...args) {
    log.push([trap, ...args]);
    return Reflect[trap](...args);
  }
};

let target = ['a', 'b'];
target[Symbol.isConcatSpreadable] = '';
let obj = new Proxy(target, handler);

log.length = 0;
arktest.assertEQ([obj], [].concat(obj));
arktest.assertEQ(1, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);

log.length = 0;
arktest.assertEQ([obj], Array.prototype.concat.apply(obj));
arktest.assertEQ(2, log.length);  // An extra read for the constructor
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, 'constructor', obj], log[0]);
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[1]);

(() => {
let proxy = new Proxy([], {});

let log = [];
let logger = {};
let handler = new Proxy({}, logger);

logger.get = function(t, trap, r) {
  return function(...args) {
    log.push([trap, ...args]);
    return Reflect[trap](...args);
  }
};

let target = {0: 'a', 1: 'b'};
let obj = new Proxy(target, handler);

log.length = 0;
arktest.assertEQ([obj], [].concat(obj));
arktest.assertEQ(1, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);

log.length = 0;
arktest.assertEQ([obj], Array.prototype.concat.apply(obj));
arktest.assertEQ(1, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);
})();
