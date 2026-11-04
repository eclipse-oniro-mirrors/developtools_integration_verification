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

// arktsid: sort_comparefn_throws
// description: Array.prototype.sort should not eat exceptions; an exception thrown
//   by the comparefn propagates out of sort().
// Conversion notes:
//  - Mirrors the existing sort_comparefn_propagates_exception.ets pattern: the
//    comparefn throws an Error, and arktest.expectThrow asserts the exception
//    propagates to the caller.

function main(): void {
    let x: int[] = [1, 0];
    arktest.expectThrow(() => {
        x.sort((_a: int, _b: int): int => {
            throw new Error('error');
        });
    }, (e: Error): boolean => e instanceof Error);
}