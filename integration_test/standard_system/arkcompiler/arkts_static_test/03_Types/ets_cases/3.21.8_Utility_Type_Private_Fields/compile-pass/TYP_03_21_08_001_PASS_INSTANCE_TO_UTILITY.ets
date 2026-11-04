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
 * @id TYP_03_21_08_001_PASS_INSTANCE_TO_UTILITY
 * @expect compile-pass
 * @section 3.21.8
 * @design 原类实例含 private 字段可赋值给 Readonly（spec 原例）
 * @note 正向用例
 */
class A1 {
  public_field: int = 444
  private private_field: string = "hello"
}

function testInstanceToUtility(): void {
  let ro: Readonly<A1> = new A1()
}