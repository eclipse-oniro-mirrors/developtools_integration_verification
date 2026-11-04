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
 * @id ENM_11_04_011_FAIL_FROMVALUE_WRONG_BASE_TYPE
 * @expect compile-fail
 * @section 11.4
 * @design fromValue 参数类型必须匹配枚举基类型
 * @note 反向用例：验证 int 基枚举 fromValue 不接受 string 参数
 */
enum MethodBaseColor { Red, Green }
function testFromValueWrongBaseType(): void {
  let c: MethodBaseColor = MethodBaseColor.fromValue("Red")
}
