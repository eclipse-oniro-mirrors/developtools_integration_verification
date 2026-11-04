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
 * @id TYP_03_09_002_PASS_OBJECT_ACCEPT_PRIMITIVE
 * @expect compile-pass
 * @section 3.9
 * @design Object 接受数值/布尔/字符串等（装箱）
 * @note 正向用例
 */
function testObjectAcceptPrimitive(): void {
  let o: Object = 1
  o = 1.5
  o = true
  o = "hello"
  o = 100n
}