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
 * @id CLS_09_10_034_RUNTIME_PROTECTED_ACCESS
 * @expect runtime
 * @section 9.10
 * @design protected成员在子类中可访问
 * @note 运行时用例：验证子类可访问父类protected字段
 */
class Base16 { protected data: int = 99 }
class Child16 extends Base16 {
  getData(): int { return this.data }
  setData(v: int): void { this.data = v }
}
function main(): void {
  let c: Child16 = new Child16()
  if (c.getData() != 99) { throw new Error("protected should be accessible") }
  c.setData(55)
  if (c.getData() != 55) { throw new Error("protected should be modifiable") }
  console.log("verified")
}
