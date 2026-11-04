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

// arktsid: reduceright_single_element_no_init_callback_not_called
// description: Array.prototype.reduceRight - callbackfn not called for array with one element

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [1];
    let r: int = arr.reduceRight((prev: int, cur: int): int => {
        callCnt = callCnt + 1;
        return 2;
    });
    arktest.assertEQ(r, 1, 'arr.reduceRight(callbackfn)');
    arktest.assertEQ(callCnt, 0, 'callCnt');
}