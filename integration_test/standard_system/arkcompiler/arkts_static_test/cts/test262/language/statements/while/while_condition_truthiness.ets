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

// arktsid: while_condition_truthiness
// description: Numeric/string/null values are coerced to boolean in a while condition in ArkTS
// Conversion notes: test262 的 S12.6.2_A1 用例测 while(0)/while("")/while(null) 真值性；ArkTS 实测接受数值/字符串/null 作条件并做 boolean
// 强转（静默接受，见 §D）

function main(): void {
    let zero: int = 0;
    while (0) {
        zero++;
        break;
    }
    arktest.assertEQ(zero, 0);

    let one: int = 0;
    while (1) {
        one++;
        break;
    }
    arktest.assertEQ(one, 1);
}