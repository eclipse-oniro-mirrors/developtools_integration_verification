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
 * @id SEM_15_05_00_105_FAIL_COVARIANT_PARAM
 * @expect compile-fail
 * @section 15.5
 * @design 验证协变位置禁止参数：out 类型参数不可用于参数位置
 * @note 反向用例：协变类型参数用于 in-position 应编译拒绝
 */
interface Producer<out T> { produce(): T; produceWith(t: T): void; }
function main(): void {
let p: Producer<Animal> = new Producer<Animal>();
}
