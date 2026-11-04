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
 * @id EXP2_17_09_2_008_PASS_METHODOVERLOAD_STATIC
 * @expect compile-pass
 * @section 17.9.2
 * @design static overload 包含 static 方法
 * @note 正向用例：所有方法都是 static
 */
class MathUtils {
  static addInt(a: int, b: int): int { return a + b }
  static addDbl(a: double, b: double): double { return a + b }
  static addStr(a: string, b: string): string { return a + b }
  static overload add { addInt, addDbl, addStr }
}
