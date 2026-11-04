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
// protocol (https://tc39.es/ecma262/#sec-getiterator).
// Here, calling @@iterator property returns invalid JS receiver.
// This test ensures that the optimized version of the GetIterator bytecode
// correctly handle the SymbolIteratorInvalid exception without deoptimizing.


/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

let iteratorCount = 0;
let exceptionCount = 0;

function foo(obj) {
    // The following for-of loop uses the iterator protocol to iterate
    // over the 'obj'.
    // The GetIterator bytecode involves 3 steps:
    // 1. method = GetMethod(obj, @@iterator)
    // 2. iterator = Call(method, obj)
    // 3. if(!IsJSReceiver(iterator)) throw SymbolIteratorInvalid.
     try{
        for(let a of obj){
            arktest.assertTrue(false);
        }
    } catch(e){
        exceptionCount++;
    }
}

// This iterator retuns '1' which is not a valid JSReceiver
const iterator = function() {
    iteratorCount++;
    return 1;
}

let y = {
    get [Symbol.iterator]() {
       return iterator;
    }
};

ArkTools.prepareFunctionForOptimization(foo);
foo(y);
foo(y);
ArkTools.optimizeFunctionOnNextCall(foo);
foo(y);
assertOptimized(foo);
arktest.assertEQ(iteratorCount, 3);
arktest.assertEQ(exceptionCount, 3);
