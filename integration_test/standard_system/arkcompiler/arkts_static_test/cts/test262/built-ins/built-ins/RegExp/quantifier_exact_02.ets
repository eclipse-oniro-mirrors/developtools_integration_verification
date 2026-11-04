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
// arktsid: quantifier_exact_02
// description: Execute /\w{3}\d?/.exec("CELL￝box127") and check results
// Conversion notes:
//  - \d? is optional; greedy \w{3} consumes "CEL", \d? matches zero digits, so match is "CEL" at index 0

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('\\w{3}\\d?').exec('CELL￝box127');
    arktest.assertEQ(executed!.length, 1);
    arktest.assertEQ(executed!.index, 0);
    arktest.assertEQ(executed!.input, 'CELL￝box127');
    arktest.assertEQ(executed![0], 'CEL');
}