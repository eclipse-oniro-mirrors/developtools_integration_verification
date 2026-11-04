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
 * @id EXP_07_16_002_PASS_INSTANCEOF_SMART_CAST
 * @expect compile-pass
 * @section 7.16
 * @design 验证 instanceof 在 if 子句中触发 smart cast，编译通过
 * @note 正向用例：instanceof 后类型收窄编译通过
 */
class A { foo(): int { return 1 } }
class B extends A { bar(): int { return 2 } }

function test(x: A): int {
  if (x instanceof B) {
    return x.bar()
}
  return x.foo()
}
let r: int = test(new B())
