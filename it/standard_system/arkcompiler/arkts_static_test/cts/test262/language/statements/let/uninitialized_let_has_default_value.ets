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

// arktsid: uninitialized_let_has_default_value
// description: An uninitialized let declaration has a default value (0 for int) in ArkTS
// Conversion notes: test262 的 TDZ 用例期望访问未初始化 let 抛 ReferenceError；ArkTS 实测 `let x: int` 未初始化即取默认值 0（静默接受，见 §D）

function main(): void {
    let x: int;
    arktest.assertEQ(x, 0);
}
