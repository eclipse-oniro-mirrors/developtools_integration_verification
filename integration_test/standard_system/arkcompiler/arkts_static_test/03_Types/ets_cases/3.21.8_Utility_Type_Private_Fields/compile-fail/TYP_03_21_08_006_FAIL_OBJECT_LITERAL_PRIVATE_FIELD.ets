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
 * @id TYP_03_21_08_006_FAIL_OBJECT_LITERAL_PRIVATE_FIELD
 * @expect compile-fail
 * @section 3.21.8
 * @design Utility type object literal 不可包含 private 字段名
 * @note 反向用例：spec 原例 private_field 是 incorrect field name
 */
class PrivateFieldA6 {
  public_field: int = 1
  private private_field: string = "hidden"
}
function acceptReadonlyA6(value: Readonly<PrivateFieldA6>): void {}
function testObjectLiteralPrivateFieldFail(): void {
  acceptReadonlyA6({ public_field: 777, private_field: "" })
}
