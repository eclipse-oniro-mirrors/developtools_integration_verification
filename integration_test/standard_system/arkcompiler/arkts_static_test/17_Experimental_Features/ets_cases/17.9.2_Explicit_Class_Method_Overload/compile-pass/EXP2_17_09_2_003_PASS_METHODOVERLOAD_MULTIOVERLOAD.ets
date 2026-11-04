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
 * @id EXP2_17_09_2_003_PASS_METHODOVERLOAD_MULTIOVERLOAD
 * @expect compile-pass
 * @section 17.9.2
 * @design 同一个类中可以有多个 overload 声明
 * @note 正向用例：多个 overload 集存在于同一个类中
 */
class MultiOverload {
  m1(a: int): int { return a }
  m2(a: string): int { return a.length }
  m3(a: double): int { return new Double(a).toInt() }
  m4(a: boolean): int { return a ? 1 : 0 }

  overload getInt { m1, m2 }
  overload getInt2 { m3, m4 }
}
