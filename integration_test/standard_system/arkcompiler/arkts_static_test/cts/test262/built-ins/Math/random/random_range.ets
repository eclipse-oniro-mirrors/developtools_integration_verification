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
// arktsid: math_random_range
// description: Math.random() returns a number in [0, 1) over 100 calls

function main(): void {
    for (let i: int = 0; i < 100; i++) {
        let val: double = Math.random();
        arktest.assertTrue(typeof val === 'number', 'random is a number');
        arktest.assertFalse(isNaN(val), 'random is not NaN');
        arktest.assertTrue(val >= 0.0 && val < 1.0, 'random in [0, 1)');
    }
}