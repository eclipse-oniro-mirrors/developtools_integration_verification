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

// arktsid: reduceright_callback_zero_params
// description: Array.prototype.reduceRight - callbackfn is called with 0 formal parameter
// Conversion notes:
//  - The JS callback declares 0 formal parameters and always returns true; initialValue
//    is 11 (number) but the callback returns a boolean, giving a heterogeneous accumulator.
//    initialValue is changed to true so U is uniformly boolean (mirroring the
//    reduce/callbackfn-is-a-function migration). The callback ignores prev, so the result
//    (true) and call count (2) are unchanged.
//  - A 0-formal-parameter callback is represented by a 1-parameter arrow whose only
//    parameter is unused (consistent with the forEach 0-formal-parameter migration).

function main(): void {
    let called: int = 0;
    let arr: int[] = [11, 12];
    let result: boolean = arr.reduceRight<boolean>((_prev: boolean): boolean => {
        called++;
        return true;
    }, true);
    arktest.assertEQ(result, true, '[11, 12].reduceRight(callbackfn, 11)');
    arktest.assertEQ(called, 2, 'called');
}