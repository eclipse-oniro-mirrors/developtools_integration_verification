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
 * @id SEM_15_11_10_101_FAIL_dynamic_arg_mismatch
 * @expect compile-fail
 * @section 15.11.10
 * @design 动态解析拒绝：参数类型不匹配
 * @note 反向用例：子类覆写方法后通过基类引用调用时参数不匹配
 */
class B { f(x: int): void {} }
class D extends B { override f(x: int): void {} }
function main(): void {
    let b: B = new D();
    b.f('s');
}
