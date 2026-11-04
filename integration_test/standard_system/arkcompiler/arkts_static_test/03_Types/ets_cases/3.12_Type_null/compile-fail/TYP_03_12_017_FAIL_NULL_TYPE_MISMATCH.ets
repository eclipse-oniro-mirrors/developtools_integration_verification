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
 * @id TYP_03_12_017_FAIL_NULL_TYPE_MISMATCH
 * @expect compile-fail
 * @section 3.12
 * @design null 类型变量赋值为非 null 值（如数值、字符串、undefined）
 * @note 反向用例：验证类型 null 只能持有值 null
 */
function testNullTypeMismatch(): void {
  let x: null = 42
  let y: null = "hello"
  let z: null = undefined
}