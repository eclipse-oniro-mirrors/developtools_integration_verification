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
 * @id CLS_09_03_003_PASS_IMPLEMENTS_ALL_METHODS
 * @expect compile-pass
 * @section 9.3
 * @design 非抽象类实现接口所有方法编译通过
 * @note 正向用例：验证非抽象类必须实现所有接口方法
 */
interface ICalc {
  add(a: int, b: int): int
  sub(a: int, b: int): int
}
class Calculator implements ICalc {
  add(a: int, b: int): int { return a + b }
  sub(a: int, b: int): int { return a - b }
}
