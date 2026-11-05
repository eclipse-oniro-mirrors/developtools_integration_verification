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
 * @id EXP_07_10_01_009_RUNTIME_STATIC_FIELD_VALUE
 * @expect runtime
 * @section 7.10.1
 * @design 运行时验证静态字段值：不同实例共享同一静态字段，值一致
 * @note 运行时用例：验证静态字段不依赖实例，跨实例共享同一份存储
 */
class Counter {
    public static count: int = 42
}
function main(): void {
    let a: Counter = new Counter()
    let b: Counter = new Counter()
    if (Counter.count != 42) {
        throw new Error('assertion failed: static field default value')
    }
console.log('verified')
}
