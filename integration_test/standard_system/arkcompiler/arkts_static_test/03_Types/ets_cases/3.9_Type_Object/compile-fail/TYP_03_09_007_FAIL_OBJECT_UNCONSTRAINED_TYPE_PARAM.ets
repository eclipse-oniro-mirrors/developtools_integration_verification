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
 * @id TYP_03_09_007_FAIL_OBJECT_UNCONSTRAINED_TYPE_PARAM
 * @expect compile-fail
 * @section 3.9
 * @design Object 不接受类型参数 T（无 extends Object 约束时）
 *   spec §3.9: Object 不是 Type Parameters 的超类（除非显式约束）
 * @note 反向用例：T 默认 extends Any，不是 Object 子类
 */
class Generic7<T> {
  field: Object
  constructor() {
    let t: T = (null as Object) as T
    this.field = t   // T 不是 Object 子类，赋值失败
  }
}