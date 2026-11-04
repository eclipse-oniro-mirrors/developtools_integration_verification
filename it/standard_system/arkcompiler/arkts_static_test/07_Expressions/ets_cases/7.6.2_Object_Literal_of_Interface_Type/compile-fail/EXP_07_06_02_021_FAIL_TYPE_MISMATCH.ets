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
 * @id EXP_07_06_02_021_FAIL_TYPE_MISMATCH
 * @expect compile-fail
 * @section 7.6.2
 * @design 属性值类型不匹配：name 为 string 类型，赋值为 123 (int) 应编译时错误
 * @note 反向用例：验证对象字面量中属性值类型必须与接口属性类型兼容
 */
interface Person {
    name: string
}
let b: Person = {name: 123}
