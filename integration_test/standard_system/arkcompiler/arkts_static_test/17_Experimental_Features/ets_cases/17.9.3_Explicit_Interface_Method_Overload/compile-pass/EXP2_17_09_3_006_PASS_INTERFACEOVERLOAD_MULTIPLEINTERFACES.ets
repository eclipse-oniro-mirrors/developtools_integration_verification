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
 * @id EXP2_17_09_3_006_PASS_INTERFACEOVERLOAD_MULTIPLEINTERFACES
 * @expect compile-pass
 * @section 17.9.3
 * @design 实现多个接口，各有不同的 overload
 * @note 正向用例：多个接口的不同 overload 可以共存
 */
interface IA {
  aInt(a: int): string
  aStr(a: string): string
  overload dispatch { aInt, aStr }
}

interface IB {
  bInt(a: int): int
  bDbl(a: double): int
  overload convert { bInt, bDbl }
}

class MultiImpl implements IA, IB {
  aInt(a: int): string { return 'a:' + a }
  aStr(a: string): string { return 'a:' + a }
  bInt(a: int): int { return a }
  bDbl(a: double): int { return new Double(a).toInt() }
  overload dispatch { aInt, aStr }
  overload convert { bInt, bDbl }
}
