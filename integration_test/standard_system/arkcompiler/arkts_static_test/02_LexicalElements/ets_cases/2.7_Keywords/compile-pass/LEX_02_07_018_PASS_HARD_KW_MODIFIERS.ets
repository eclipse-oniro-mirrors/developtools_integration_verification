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
 * @id LEX_02_07_018_PASS_HARD_KW_MODIFIERS
 * @expect compile-pass
 * @section 2.7
 * @design 硬关键字: static, abstract, override (final 待 ArkTS 实现)
 * @note 正向用例：static/abstract/override 修饰符
 */
abstract class Base018 {
  static count: int = 0
  abstract compute(): int
}

class Derived018 extends Base018 {
  override compute(): int {
    return 42
  }
}

function test018(): void {
  let d: Derived018 = new Derived018()
  let v: int = d.compute()
  let c: int = Base018.count
}
