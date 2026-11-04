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

// arktsid: flatmap_mapper_exception_propagates
// description: Array.prototype.flatMap propagates exception from mapper; empty source does not call mapper
// Conversion notes: test262 B|throws, 1:1 migration.

function main(): void {
    // Check #1: non-empty source, mapper throws
    let caught: boolean = false;
    try {
        let a: int[] = [0];
        let r = a.flatMap((x: int): int[] => {
            throw new Error('mapper threw');
        });
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'mapper exception should propagate');

    // Check #2: empty source, mapper NOT called
    let callcount: int = 0;
    let b: int[] = [];
    let r2 = b.flatMap((x: int): int[] => {
        callcount++;
        throw new Error('should not be called');
    });
    arktest.assertEQ(callcount, 0, 'empty source should not call mapper');
}