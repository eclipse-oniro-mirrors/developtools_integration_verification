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
 * @id EXP_07_10_02_002_PASS_FIELD_ASSIGNMENT
 * @expect compile-pass
 * @section 7.10.2
 * @design 非 readonly 实例字段赋值：obj.field = newValue 修改字段值（variable 语义）
 * @note 正向用例：验证非 readonly 实例字段结果值为 variable，可作为赋值左值
 */
class Counter {
    public value: int = 0
    public label: string = 'init'
}
function update(): void {
    let c: Counter = new Counter()
    c.value = 42
    c.label = 'updated'
}
