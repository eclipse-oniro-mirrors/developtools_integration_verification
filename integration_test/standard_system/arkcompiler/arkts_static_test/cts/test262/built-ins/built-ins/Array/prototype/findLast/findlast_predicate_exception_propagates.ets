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

// arktsid: findlast_predicate_exception_propagates
// description: Array.prototype.findLast propagates exception thrown in predicate
// Conversion notes: test262 B|throws, 1:1 migration.

function main(): void {
    let caught: boolean = false;
    try {
        let a: int[] = [1];
        a.findLast((val: int, idx: int, arr: int[]): boolean => {
            throw new Error('predicate threw');
        });
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'exception should propagate');
}