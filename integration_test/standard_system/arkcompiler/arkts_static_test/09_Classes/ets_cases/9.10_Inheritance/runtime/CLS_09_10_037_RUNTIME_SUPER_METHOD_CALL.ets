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
 * @id CLS_09_10_037_RUNTIME_SUPER_METHOD_CALL
 * @expect runtime
 * @section 9.10
 * @design super.method()调用父类被重写的方法
 * @note 运行时用例：验证子类通过super调用父类方法
 */
class Base19 {
  value: int = 10
  getValue(): int { return this.value }
}
class Child19 extends Base19 {
  override getValue(): int { return super.getValue() + 1 }
}
function main(): void {
  let c: Child19 = new Child19()
  if (c.getValue() != 11) { throw new Error("super.getValue should return 10 + 1") }
  console.log("verified")
}
