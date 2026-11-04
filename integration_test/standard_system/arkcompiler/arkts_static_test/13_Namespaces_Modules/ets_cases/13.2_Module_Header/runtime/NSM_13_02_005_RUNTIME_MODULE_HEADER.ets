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
/*
 * NSM_13_02_005_RUNTIME_MODULE_HEADER
 * @id NSM_13_02_005_RUNTIME_MODULE_HEADER
 * @expect runtime
 * @section 13.2
 * @design module header 定义模块名使其可被 import
 * @note 运行时用例：验证 module header 运行时行为
 *       ⚠️ C 类：es2panda 不支持 module header 语法，编译失败
 *       分类：C 类（编译器实现限制 — 不支持 module header 语法）
 */
export module 'RuntimeMod'

export let x: int = 100

function main(): int {
    console.log(x.toString())
    return x == 100 ? 0 : 1
}
