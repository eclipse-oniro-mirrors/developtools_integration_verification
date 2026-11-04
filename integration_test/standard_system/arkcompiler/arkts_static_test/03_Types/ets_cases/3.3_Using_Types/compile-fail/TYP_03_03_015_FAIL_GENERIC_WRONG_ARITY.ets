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
 * @id TYP_03_03_015_FAIL_GENERIC_WRONG_ARITY
 * @expect compile-fail
 * @section 3.3
 * @design 泛型类型参数数量不匹配应编译失败
 * @note 反向用例：泛型类型参数过多/过少
 */
class Box15<T> {
  v: T
  constructor(x: T) { this.v = x }
}

function testGenericArityFail(): void {
  // 缺少类型参数
  let a: Box15 = new Box15(1)
  // 类型参数过多
  let b: Box15<int, string> = new Box15<int, string>(1, "a")
}