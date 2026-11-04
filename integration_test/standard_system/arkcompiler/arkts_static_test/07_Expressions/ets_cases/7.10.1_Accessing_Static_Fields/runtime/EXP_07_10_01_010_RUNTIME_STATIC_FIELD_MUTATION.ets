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
 * @id EXP_07_10_01_010_RUNTIME_STATIC_FIELD_MUTATION
 * @expect runtime
 * @section 7.10.1
 * @design 运行时验证非 readonly 静态字段赋值：修改后全局可见（variable 语义）
 * @note 运行时用例：验证静态字段修改后所有读取都反映新值
 */
class Counter {
    public static count: int = 0
}
function increment(): void {
    Counter.count = Counter.count + 1
}
function main(): void {
    Counter.count = 10
    if (Counter.count != 10) {
        throw new Error('assertion failed: initial assignment')
    }
    Counter.count = Counter.count + 5
    if (Counter.count != 15) {
        throw new Error('assertion failed: after increment')
    }
console.log('verified')
}
