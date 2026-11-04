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
 * @id TYP_03_04_013_FAIL_TYPE_PARAM_OUT_OF_SCOPE
 * @expect compile-fail
 * @section 3.4
 * @design 类型参数仅在所属泛型内有效，外部不可见
 * @note 反向用例：类型参数 T 在 class 外引用应失败
 */
class WithT<T> {
  v: T
  constructor(x: T) { this.v = x }
}

// T 在 WithT 之外不可见
let outside: T = 1
let outside2: WithT<int> = new WithT<T>(1)