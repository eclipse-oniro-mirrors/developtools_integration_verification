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

// Note: concat does not currently support species so there is no difference
// between [].concat(foo) and Array.prototype.concat.apply(foo).

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0301: Can't resolve array type"
---*/

let log = [];
let logger = {};
let handler = new Proxy({}, logger);

logger.get = function(t, trap, r) {
  return function(...args) {
    log.push([trap, ...args]);
    return Reflect[trap](...args);
  }
};

let target = {0: 'a', 1: 'b', [Symbol.isConcatSpreadable]: 'truish'};
let obj = new Proxy(target, handler);

log.length = 0;
arktest.assertEQ([], [].concat(obj));
arktest.assertEQ(2, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);
arktest.assertEQ(['get', target, 'length', obj], log[1]);

log.length = 0;
arktest.assertEQ([], Array.prototype.concat.apply(obj));
arktest.assertEQ(2, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);
arktest.assertEQ(['get', target, 'length', obj], log[1]);

target.length = 3;

log.length = 0;
arktest.assertEQ(['a', 'b', ,], [].concat(obj));
arktest.assertEQ(7, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);
arktest.assertEQ(['get', target, 'length', obj], log[1]);
arktest.assertEQ(['has', target, '0'], log[2]);
arktest.assertEQ(['get', target, '0', obj], log[3]);
arktest.assertEQ(['has', target, '1'], log[4]);
arktest.assertEQ(['get', target, '1', obj], log[5]);
arktest.assertEQ(['has', target, '2'], log[6]);

(() => {
'use strict';
let arr = [];
arr[4] = 'Item 4';
arr[8] = 'Item 8';
let arr2 = ['.', '!', '?'];
arktest.assertEQ(
    [, , , , 'Item 4', , , , 'Item 8', '.', '!', '?'], arr.concat(arr2));
})();

(() => {
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
target[Symbol.isConcatSpreadable] = undefined;
let obj = new Proxy(target, handler);

log.length = 0;
arktest.assertEQ(['a', 'b'], [].concat(obj));
arktest.assertEQ(6, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);
arktest.assertEQ(['get', target, 'length', obj], log[1]);
arktest.assertEQ(['has', target, '0'], log[2]);
arktest.assertEQ(['get', target, '0', obj], log[3]);
arktest.assertEQ(['has', target, '1'], log[4]);
arktest.assertEQ(['get', target, '1', obj], log[5]);

log.length = 0;
arktest.assertEQ(['a', 'b'], Array.prototype.concat.apply(obj));
arktest.assertEQ(7, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, 'constructor', obj], log[0]);
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[1]);
arktest.assertEQ(['get', target, 'length', obj], log[2]);
arktest.assertEQ(['has', target, '0'], log[3]);
arktest.assertEQ(['get', target, '0', obj], log[4]);
arktest.assertEQ(['has', target, '1'], log[5]);
arktest.assertEQ(['get', target, '1', obj], log[6]);
})();

log.length = 0;
arktest.assertEQ(['a', 'b', ,], Array.prototype.concat.apply(obj));
arktest.assertEQ(7, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});
arktest.assertEQ(['get', target, Symbol.isConcatSpreadable, obj], log[0]);
arktest.assertEQ(['get', target, 'length', obj], log[1]);
arktest.assertEQ(['has', target, '0'], log[2]);
arktest.assertEQ(['get', target, '0', obj], log[3]);
arktest.assertEQ(['has', target, '1'], log[4]);
arktest.assertEQ(['get', target, '1', obj], log[5]);
arktest.assertEQ(['has', target, '2'], log[6]);
