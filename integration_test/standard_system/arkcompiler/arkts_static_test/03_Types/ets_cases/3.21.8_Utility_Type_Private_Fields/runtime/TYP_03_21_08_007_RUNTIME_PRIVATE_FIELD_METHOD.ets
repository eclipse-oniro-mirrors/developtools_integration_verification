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
 * @id TYP_03_21_08_007_RUNTIME_PRIVATE_FIELD_METHOD
 * @expect runtime
 * @section 3.21.8
 * @design 原类实例赋值给 Readonly 后仍保留 private 字段支持类内方法读取
 * @note 运行时用例：通过 public method 间接验证 private state 保留
 */
class PrivateFieldA7 {
  public_field: int = 444
  private private_field: string = "hello"
  readPrivate(): string { return this.private_field }
}
function main(): void {
  let obj = new PrivateFieldA7()
  let ro: Readonly<PrivateFieldA7> = obj
  if (ro.public_field != 444) throw new Error("public field mismatch")
  if (obj.readPrivate() != "hello") throw new Error("private field state mismatch")
  console.log("private fields in utility type verified")
}
