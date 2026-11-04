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
 * @id TYP_03_21_08_005_PASS_OBJECT_LITERAL_PUBLIC_ONLY
 * @expect compile-pass
 * @section 3.21.8
 * @design Utility type object literal 只允许公开字段
 * @note 正向用例：Readonly<A> object literal 可只包含 public_field
 */
class PrivateFieldA5 {
  public_field: int = 1
  private private_field: string = "hidden"
}
function acceptReadonlyA5(value: Readonly<PrivateFieldA5>): void {}
function testObjectLiteralPublicOnly(): void {
  acceptReadonlyA5({ public_field: 777 })
}
