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
 * @id EXP_07_10_02_009_FAIL_NULLISH_REF_FIELD_ACCESS
 * @expect compile-fail
 * @section 7.10.2
 * @design nullish 引用类型访问字段：T | undefined 类型的 objectReference 访问字段应报编译错误
 * @note 反向用例：验证 nullish 引用类型访问字段时编译时错误
 */
class Data {
    public value: int = 0
}
let d: Data | undefined = new Data()
let v: int = d.value
