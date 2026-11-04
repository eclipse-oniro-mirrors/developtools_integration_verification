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
 * @id CLS_09_06_4_004_RUNTIME_FIELD_INIT_ORDER
 * @expect runtime
 * @section 9.6.4
 * @design 字段初始化顺序运行时验证
 * @note 运行时用例：验证字段按声明顺序初始化
 */
class InitOrder {
  a: int = 1
  b: int = 2
  c: int = 3
  constructor() {}
  getSum(): int { return this.a + this.b + this.c }
}
function main(): void {
  let o = new InitOrder()
  if (o.getSum() != 6) { throw new Error("getSum() should be 6") }
  console.log("Field init order verified")
}
