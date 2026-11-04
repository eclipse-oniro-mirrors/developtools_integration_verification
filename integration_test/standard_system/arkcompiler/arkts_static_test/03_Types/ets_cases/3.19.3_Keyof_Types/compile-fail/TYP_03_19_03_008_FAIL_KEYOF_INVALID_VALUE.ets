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
 * @id TYP_03_19_03_008_FAIL_KEYOF_INVALID_VALUE
 * @expect compile-fail
 * @section 3.19.3
 * @design keyof 结果类型赋值不合法字符串应报错
 * @note 反向用例：keyof 结果只能赋值有效成员名
 */
class A8 {
  field: number = 0
  method(): void {}
}
type KeysOfA8 = keyof A8

function testInvalidValueFail(): void {
  let key: KeysOfA8 = "any string different from field or method"
}