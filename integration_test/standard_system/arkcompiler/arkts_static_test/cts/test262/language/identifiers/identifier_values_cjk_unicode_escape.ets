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

// arktsid: identifier_values_cjk_unicode_escape
// description: CJK unified ideographs are valid identifier values via escapes

function main(): void {
    let \u4e00: int = 1;
    arktest.assertEQ(一, 1);
    let \u6c5f: int = 1;
    arktest.assertEQ(江, 1);
    let \u9fa5: int = 1;
    arktest.assertEQ(龥, 1);
    let \u3400: int = 1;
    arktest.assertEQ(㐀, 1);
    let \u362e: int = 1;
    arktest.assertEQ(㘮, 1);
    let \u4db5: int = 1;
    arktest.assertEQ(䶵, 1);
}
