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
 * @id EXP_07_10_02_011_RUNTIME_FIELD_MUTATION
 * @expect runtime
 * @section 7.10.2
 * @design 运行时验证实例字段修改：非 readonly 字段修改后反映新值
 * @note 运行时用例：验证实例字段的 variable 语义，赋值后读取新值
 */
class Data {
    public value: int = 0
    public label: string = ''
}
function main(): void {
    let d: Data = new Data()
    d.value = 42
    if (d.value != 42) {
        throw new Error('assertion failed: field value after assignment')
    }
    d.value = d.value + 8
    if (d.value != 50) {
        throw new Error('assertion failed: field value after increment')
    }
console.log('verified')
}
