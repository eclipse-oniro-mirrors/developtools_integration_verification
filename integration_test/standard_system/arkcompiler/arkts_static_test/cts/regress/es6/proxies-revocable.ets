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
expected_out_1: "Syntax error ESY0224: Identifier expected, got '{'."
---*/

const traps = [
    'getPrototypeOf', 'setPrototypeOf', 'isExtensible', 'preventExtensions',
    'getOwnPropertyDescriptor', 'has', 'get', 'set', 'deleteProperty',
    'defineProperty', 'ownKeys', 'apply', 'construct'
];

let {proxy, revoke} = Proxy.revocable({}, {});
arktest.assertEQ(0, revoke.length);

arktest.assertEQ(undefined, revoke());
for (let trap of traps) {
  arktest.expectThrow(() => Reflect[trap](proxy), ((e: Error): boolean => e instanceof TypeError));
}

arktest.assertEQ(undefined, revoke());
for (let trap of traps) {
  arktest.expectThrow(() => Reflect[trap](proxy), ((e: Error): boolean => e instanceof TypeError));
}
