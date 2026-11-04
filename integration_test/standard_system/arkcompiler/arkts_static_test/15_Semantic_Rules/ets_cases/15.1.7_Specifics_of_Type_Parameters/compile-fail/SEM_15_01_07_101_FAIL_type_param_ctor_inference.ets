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
 * @id SEM_15_01_07_101_FAIL_type_param_ctor_inference
 * @expect compile-fail
 * @section 15.1.7
 * @design 规范示例：类型参数作为构造函数参数目标类型时按独立表达式推断
 * @note 反向用例：new C(1) 中 1 推断为 int，int 不是 number 的子类型，编译错误
 */
class C<T extends number> {
    constructor(x: T) {}
}
function main(): void {
let c = new C(1);
}
