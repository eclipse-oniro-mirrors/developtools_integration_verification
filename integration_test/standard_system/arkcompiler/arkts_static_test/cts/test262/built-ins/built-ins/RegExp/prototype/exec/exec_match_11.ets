/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: exec_match_11
// description: String is new Number(1.012) and RegExp is /2|12/

function main(): void {
    // new Number(1.012) is ToString-coerced to "1.012"; ArkTS exec takes string
    let m = new RegExp('2|12').exec('1.012');
    arktest.assertEQ(m![0], '12');
    arktest.assertEQ(m!.index, 3);
    arktest.assertEQ(m!.input, '1.012');
    arktest.assertEQ(m!.length, 1);
}