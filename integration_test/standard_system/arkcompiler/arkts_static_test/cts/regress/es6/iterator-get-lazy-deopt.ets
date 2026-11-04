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

// The GetIterator bytecode is used to implement a part of the iterator
// protocol (https://tc39.es/ecma262/#sec-getiterator). Here, the
// bytecode performs multiple operations including some that have side-effects
// and may deoptimize eagerly or lazily.
// This test ensures the get @@iterator lazy deoptimization is handled correctly.


/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

let triggerLazyDeopt = false
let iteratorCount = 0;
let iteratorAfterLazyDeoptCount = 0;
let getIteratorCount = 0;

function foo(obj) {
    // The following for-of loop uses the iterator protocol to iterate
    // over the 'obj'.
    // The GetIterator bytecode involves 3 steps:
    // 1. method = GetMethod(obj, @@iterator)
    // 2. iterator = Call(method, obj).
    // 3. if(!IsJSReceiver(iterator)) throw SymbolIteratorInvalid.
    for(let x of obj){}
}

// This iterator gets inlined when the 'foo' function is JIT compiled for
// the first time.
let iterator = function() {
    iteratorCount++;
    return {
        next: function() {
            return { done: true };
        }
    }
}

const iteratorAfterLazyDeopt = function() {
    iteratorAfterLazyDeoptCount++;
    return {
        next: function() {
            return { done: true };
        }
    }
}
// Here, retrieval of function at @@iterator has side effect (increments the
// 'getIteratorCount').The lazy deoptimization is triggerred by setting the
// 'triggerLazyDeopt' to true after the count is incremented. Now the deopt
// cannot resume at the beginning of the bytecode because it would end up in
// incrementing the count again.
let y = { get [Symbol.iterator] () {
            getIteratorCount++;
            if(triggerLazyDeopt) {
                ArkTools.deoptimizeFunction(foo);
                iterator = iteratorAfterLazyDeopt
            }
            return iterator;
         }
    };

ArkTools.prepareFunctionForOptimization(foo);
foo(y);
foo(y);
ArkTools.optimizeFunctionOnNextCall(foo);
triggerLazyDeopt = true;
foo(y);
assertUnoptimized(foo);
arktest.assertEQ(getIteratorCount, 3);
arktest.assertEQ(iteratorCount, 2);
arktest.assertEQ(iteratorAfterLazyDeoptCount, 1);

(() => {
let getIteratorCount = 0;
let iteratorCount = 0;
let iteratorAfterEagerDeoptCount = 0;

function foo(obj) {
    for(let x of obj){}
}

let iterator = function() {
    iteratorCount++;
    return {
        next: function() {
            return { done: true };
        }
    }
}

let iteratorAfterEagerDeopt = function() {
    iteratorAfterEagerDeoptCount++;
    return {
        next: function() {
            return { done: true };
        }
    }
}

let y = { get [Symbol.iterator] () {
            getIteratorCount++;
            return iterator;
         }
    };

ArkTools.prepareFunctionForOptimization(foo);
foo(y);
foo(y);
ArkTools.optimizeFunctionOnNextCall(foo);

iterator = iteratorAfterEagerDeopt
foo(y);
assertUnoptimized(foo);
arktest.assertEQ(getIteratorCount, 3);
arktest.assertEQ(iteratorCount, 2);
arktest.assertEQ(iteratorAfterEagerDeoptCount, 1);
})();
