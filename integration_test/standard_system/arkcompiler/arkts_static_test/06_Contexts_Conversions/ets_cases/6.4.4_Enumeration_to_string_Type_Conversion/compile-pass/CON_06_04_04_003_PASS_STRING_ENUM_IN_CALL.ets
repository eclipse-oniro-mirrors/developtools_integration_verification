/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id CON_06_04_04_003_PASS_STRING_ENUM_IN_CALL
 * @expect compile-pass
 * @section 6.4.4
 * @design string 枚举在调用上下文中: 枚举→string 形参
 * @note 正向用例：string 枚举作为实参
 */
enum Label { Start = 'start', Stop = 'stop' }

function takeString(s: string): void {}
function takeUnion(u: string | int): void {}

function testStringEnumInCall(): void {
  let e: Label = Label.Start
  takeString(e)
  takeUnion(e)
}
