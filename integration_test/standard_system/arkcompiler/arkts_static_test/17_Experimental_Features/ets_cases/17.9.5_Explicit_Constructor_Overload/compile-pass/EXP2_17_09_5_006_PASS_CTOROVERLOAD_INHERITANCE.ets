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
 * @id EXP2_17_09_5_006_PASS_CTOROVERLOAD_INHERITANCE
 * @expect compile-pass
 * @section 17.9.5
 * @design 子类继承父类，子类自身有 overload constructor
 * @note 正向用例：继承不影响子类的 constructor overload
 */
class Vehicle2 {
  protected kind: string
  constructor(k: string) { this.kind = k }
}

class Car2 extends Vehicle2 {
  private model: string
  constructor simple(m: string) { super('car'); this.model = m }
  constructor detailed(m: string, year: int) { super('car'); this.model = m + '(' + year + ')' }
  overload constructor { simple, detailed }
}
