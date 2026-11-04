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
 * @id SEM_15_02_07_003_PASS_fixed_array_element_covariance
 * @expect compile-pass
 * @section 15.2.7
 * @design Fixedstring[] <: FixedObject[]（引用类型元素基于元素子类型协变）
 * @note 来自规范 15.2.7 例：let y: FixedObject[] = x OK
 */
function main(): void {
    let x: Fixedstring[] = ['aa', 'bb', 'cc']
    let y: FixedObject[] = x
}
