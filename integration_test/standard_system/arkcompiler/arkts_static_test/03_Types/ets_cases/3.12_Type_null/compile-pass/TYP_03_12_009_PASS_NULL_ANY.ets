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
 * @id TYP_03_12_009_PASS_NULL_ANY
 * @expect compile-pass
 * @section 3.12
 * @design Any 类型变量接受 null 值（null 是 Any 的子类型）
 * @note 正向用例：验证 Any 可持有 null
 */
function testNullAny(): void {
  let a: Any = null
  a = null
  a = 42
}