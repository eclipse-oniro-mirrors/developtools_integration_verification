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
 * NSM_13_09_001_PASS_MULTIFILE_SAME_HEADER
 * @id NSM_13_09_001_PASS_MULTIFILE_SAME_HEADER
 * @expect compile-pass
 * @section 13.9
 * @design 同 moduleHeader 的多文件模块
 * @note 正向用例：验证同 moduleHeader 多文件编译通过
 *       ⚠️ C 类：es2panda 不支持 module header 语法，且多文件模块需要构建系统
 *       分类：C 类（编译器实现限制 — 不支持 module header 语法 + 需要多文件构建）
 */
export module 'x'

function foo(): void {}
function bar(): void {}

namespace NS1 {
    function baz(): void {}
}
