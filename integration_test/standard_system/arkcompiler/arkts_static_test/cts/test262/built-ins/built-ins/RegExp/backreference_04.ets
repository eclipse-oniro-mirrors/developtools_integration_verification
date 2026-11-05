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
// arktsid: backreference_04
// description: Execute /(a*)b\1+/.exec("baaac") and check results
// Conversion notes:
//  - (a*) greedily matches empty at index 0 before "b"; \1+ backreferences the empty capture group

function main(): void {
    let executed = new RegExp('(a*)b\\1+').exec('baaac');
    arktest.assertEQ(executed!.length, 2);
    arktest.assertEQ(executed!.index, 0);
    arktest.assertEQ(executed!.input, 'baaac');
    arktest.assertEQ(executed![0], 'b');
    arktest.assertEQ(executed![1], '');
}