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
 * @id EXP2_17_13_009_PASS_RECEIVER_GENERIC
 * @expect compile-pass
 * @section 17.13
 * @design 验证泛型 receiver 类型编译通过
 * @note 正向用例：receiver 函数可使用泛?this 参数
 */
class Container<T> {
  public value: T
  constructor(v: T) { this.value = v }
}

function getBoxValue(this: Container<int>): int { return this.value }

function main(): void {
  let b: Container<int> = new Container<int>(42)
  console.log(b.getBoxValue().toString())
}

