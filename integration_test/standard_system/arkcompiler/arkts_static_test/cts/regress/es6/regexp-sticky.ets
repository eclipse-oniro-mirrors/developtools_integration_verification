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
expected_out_1: "Syntax error ESY0227: Unexpected token '/'."
---*/

const re = /foo.bar/;

arktest.assertTrue(!!'foo*bar'.match(re));
arktest.assertTrue(!!'..foo*bar'.match(re));

const plain = /foobar/;

arktest.assertTrue(!!'foobar'.match(plain));
arktest.assertTrue(!!'..foobar'.match(plain));

const sticky = /foo.bar/y;

arktest.assertTrue(!!'foo*bar'.match(sticky));
arktest.assertEQ(7, sticky.lastIndex);
arktest.assertFalse(!!'..foo*bar'.match(sticky));

const stickyplain = /foobar/y;

arktest.assertTrue(!!'foobarfoobar'.match(stickyplain));
arktest.assertEQ(6, stickyplain.lastIndex);
arktest.assertTrue(!!'foobarfoobar'.match(stickyplain));
arktest.assertEQ(12, stickyplain.lastIndex);
arktest.assertFalse(!!'..foobarfoobar'.match(stickyplain));

const global = /foo.bar/g;

arktest.assertTrue(global.test('foo*bar'));
arktest.assertFalse(global.test('..foo*bar'));
global.lastIndex = 0;
arktest.assertTrue(global.test('..foo*bar'));

const plainglobal = /foobar/g;

arktest.assertTrue(plainglobal.test('foobar'));
arktest.assertFalse(plainglobal.test('foobar'));
plainglobal.lastIndex = 0;
arktest.assertTrue(plainglobal.test('foobar'));

const stickyglobal = /foo.bar/gy;

arktest.assertTrue(stickyglobal.test('foo*bar'));
arktest.assertEQ(7, stickyglobal.lastIndex);
arktest.assertFalse(stickyglobal.test('..foo*bar'));
stickyglobal.lastIndex = 0;
arktest.assertFalse(stickyglobal.test('..foo*bar'));
stickyglobal.lastIndex = 2;
arktest.assertTrue(stickyglobal.test('..foo*bar'));
arktest.assertEQ(9, stickyglobal.lastIndex);

const stickyplainglobal = /foobar/yg;
arktest.assertTrue(stickyplainglobal.sticky);
Object.defineProperty(stickyplainglobal, 'sticky', {
    value: false
})

arktest.assertTrue(stickyplainglobal.test('foobar'));
arktest.assertEQ(6, stickyplainglobal.lastIndex);
arktest.assertFalse(stickyplainglobal.test('..foobar'));
stickyplainglobal.lastIndex = 0;
arktest.assertFalse(stickyplainglobal.test('..foobar'));
stickyplainglobal.lastIndex = 2;
arktest.assertTrue(stickyplainglobal.test('..foobar'));
arktest.assertEQ(8, stickyplainglobal.lastIndex);

arktest.assertEQ('/foo.bar/gy', '' + stickyglobal);
arktest.assertEQ('/foo.bar/g', '' + global);

arktest.assertTrue(stickyglobal.sticky);
// Openharmony only support strict mode.
// Cannot set property sticky of [object Object] which has only a getter
arktest.assertTrue(stickyglobal.sticky);

const stickyglobal2 = new RegExp('foo.bar', 'gy');
arktest.assertTrue(stickyglobal2.test('foo*bar'));
arktest.assertEQ(7, stickyglobal2.lastIndex);
arktest.assertFalse(stickyglobal2.test('..foo*bar'));
stickyglobal2.lastIndex = 0;
arktest.assertFalse(stickyglobal2.test('..foo*bar'));
stickyglobal2.lastIndex = 2;
arktest.assertTrue(stickyglobal2.test('..foo*bar'));
arktest.assertEQ(9, stickyglobal2.lastIndex);

arktest.assertEQ('/foo.bar/gy', '' + stickyglobal2);

arktest.assertTrue(stickyglobal2.sticky);
// Openharmony only support strict mode.
// Cannot set property sticky of [object Object] which has only a getter
arktest.assertTrue(stickyglobal2.sticky);

sticky.lastIndex = -1; // Causes sticky regexp to fail fast
arktest.assertFalse(sticky.test('..foo.bar'));
arktest.assertEQ(0, sticky.lastIndex);

sticky.lastIndex = -1; // Causes sticky regexp to fail fast
arktest.assertFalse(!!sticky.exec('..foo.bar'));
arktest.assertEQ(0, sticky.lastIndex);

// ES6 draft says: Even when the y flag is used with a pattern, ^ always
// matches only at the beginning of Input, or (if Multiline is true) at the
// beginning of a line.
const hat = /^foo/y;
hat.lastIndex = 2;
arktest.assertFalse(hat.test('..foo'));

const mhat = /^foo/my;
mhat.lastIndex = 2;
arktest.assertFalse(mhat.test('..foo'));
mhat.lastIndex = 2;
arktest.assertTrue(mhat.test('.\nfoo'));

// Check that we don't apply incorrect optimization to sticky regexps that
// are anchored at end.
const stickyanchored = /bar$/y;
arktest.assertFalse(stickyanchored.test('foobar'));
stickyanchored.lastIndex = 3;
arktest.assertTrue(stickyanchored.test('foobar'));
