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

const log = [];

const fake =
    {
      get source() {
        log.push('p');
        return {
          toString: function() {
            log.push('ps');
            return 'pattern';
          }
        };
      },
      get flags() {
        log.push('f');
        return {
          toString: function() {
            log.push('fs');
            return 'flags';
          }
        };
      }
    }

function testThrows(x) {
  try {
    RegExp.prototype.toString.call(x);
  } catch (e) {
    // Openharmony throw `this is not Object`, `incompatible receiver` => `this is not Object`
    arktest.assertTrue(/this is not Object/.test(e.message));
    return;
  }
  arktest.assertTrue(false);
}

testThrows(1);
testThrows(null);
Number.prototype.source = 'a';
Number.prototype.flags = 'b';
testThrows(1);

arktest.assertEQ('/pattern/flags', RegExp.prototype.toString.call(fake));
arktest.assertEQ(['p', 'ps', 'f', 'fs'], log);

// Monkey-patching is also possible on RegExp instances

let weird = /foo/;
Object.defineProperty(weird, 'flags', {value: 'bar'});
Object.defineProperty(weird, 'source', {value: 'baz'});
arktest.assertEQ('/baz/bar', weird.toString());

arktest.assertEQ('/(?:)/', RegExp.prototype.toString());
arktest.assertEQ('(?:)', RegExp.prototype.source);
arktest.assertEQ('', RegExp.prototype.flags);
