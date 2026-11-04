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
 * @id EXP_07_06_04_005_PASS_CTOR_EXECUTION
 * @expect compile-pass
 * @section 7.6.4
 * @design 构造器执行+字段覆盖编译通过：构造器设置默认值后，字段表达式覆盖该值，验证两阶段求值编译正常
 * @note 正向用例：验证构造器先执行再字段赋值可正常编译
 */
class Data {
    public value: number = 0
}
let d: Data = {value: 42}
