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

// arktsid: map_callback_exception_propagates
// description: Array.prototype.map propagates exception thrown in callback
// Conversion notes: test262 B|throws, 1:1 migration.

function main(): void {
    let called: int = 0;
    let caught: boolean = false;
    try {
        let a: int[] = [11, 10, 8];
        let r = a.map((val: int, idx: int, arr: int[]): int => {
            called++;
            if (called === 1) {
                throw new Error('Exception occurred in callbackfn');
            }
            return val;
        });
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'exception should propagate');
    arktest.assertEQ(called, 1, 'callback called exactly once');
}