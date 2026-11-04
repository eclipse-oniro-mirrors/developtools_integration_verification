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

// arktsid: reduceright_prevval_is_last_element_no_init
// description: Array.prototype.reduceRight - element to be retrieved is own data property on an Array

function main(): void {
    let testResult: boolean = false;
    let arr: int[] = [0, 1, 2];
    let r: int = arr.reduceRight((prev: int, cur: int, idx: int): int => {
        if (idx === 1) {
            testResult = (prev === 2);
        }
        return cur;
    });
    arktest.assertTrue(testResult, 'testResult !== true');
}