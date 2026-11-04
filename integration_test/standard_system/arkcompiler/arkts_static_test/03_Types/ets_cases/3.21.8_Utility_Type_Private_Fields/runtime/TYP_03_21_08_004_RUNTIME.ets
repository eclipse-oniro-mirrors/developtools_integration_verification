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
 * @id TYP_03_21_08_004_RUNTIME
 * @expect runtime
 * @section 3.21.8
 * @design utility 类型赋值后 public 字段可读取
 * @note 运行时用例
 */
class C4 {
  public_field: int = 444
  private private_field: string = "test"
}

function main(): void {
  let ro: Readonly<C4> = new C4()
  if (ro.public_field != 444) throw new Error("public field value failed")
  console.log("Private fields utility runtime verified")
}