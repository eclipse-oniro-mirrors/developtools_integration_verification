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
 * @id ENM_11_001_PASS_BASIC_INT_ENUM
 * @expect compile-pass
 * @section 11
 * @design int 基类枚举基本声明和使用
 * @note 正向用例
 */
enum Color { Red, Green, Blue }

function testBasicIntEnum(): void {
  let c: Color = Color.Red
  let cmp: boolean = c == Color.Red
}