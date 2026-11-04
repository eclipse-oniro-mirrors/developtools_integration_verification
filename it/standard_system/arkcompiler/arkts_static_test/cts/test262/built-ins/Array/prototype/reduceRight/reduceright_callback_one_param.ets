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

// arktsid: reduceright_callback_one_param
// description: Array.prototype.reduceRight - callbackfn is called with 1 formal parameter
// Conversion notes:
//  - Mutable called counter captured and incremented in the lambda.

function main(): void {
    let called: int = 0;
    let arr: int[] = [11, 12];
    let result: int = arr.reduceRight<int>((prev: int): int => {
        called++;
        return prev;
    }, 100);
    arktest.assertEQ(result, 100, '[11, 12].reduceRight(callbackfn, 100)');
    arktest.assertEQ(called, 2, 'called');
}