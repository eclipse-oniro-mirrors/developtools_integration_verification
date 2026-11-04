/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: sort_comparefn_propagates_exception
// description: An exception thrown by the compareFn propagates out of sort().
// Conversion notes:
//  - IMPORTANT discrepancy: the upstream bug_596_1.js source does NOT use a
//    throwing compareFn. It defines an object whose toString() increments a
//    counter, sorts [object, object] with the default comparator, and asserts
//    that toString() was called at least twice (i.e. sort calls ToString on
//    identical elements). That behaviour depends on JS ToString coercion of
//    arbitrary objects, which has no 1:1 equivalent in statically-typed ArkTS.
//  - Per the migration brief, this target file instead verifies the related
//    sort contract that an exception thrown from a compareFn is propagated to
//    the caller. The compareFn throws `new Error("oops")`; arktest.expectThrow
//    asserts an error is raised and that it is an Error instance. If the
//    runtime's Error class does not match `instanceof Error`, relax the
//    predicate to `() => true`.

function main(): void {
    let arr: int[] = [1, 0];

    arktest.expectThrow(() => {
        arr.sort((_a: int, _b: int): int => {
            throw new Error('oops');
        });
    }, (e: Error): boolean => e instanceof Error);
}