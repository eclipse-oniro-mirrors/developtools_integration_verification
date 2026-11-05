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
 * @id TYP_03_21_08_003_PASS_LITERAL_PUBLIC_ONLY
 * @expect compile-pass
 * @section 3.21.8
 * @design 对象字面量只有 public 字段可赋给 utility 类型
 * @note 正向用例：spec 原例 bar({public_field: 777})
 */
class A3 {
  public_field: int = 444
  private private_field: string = "hello"
}

function testLiteralPublicOnly(): void {
  let ro: Readonly<A3> = {public_field: 777}
}