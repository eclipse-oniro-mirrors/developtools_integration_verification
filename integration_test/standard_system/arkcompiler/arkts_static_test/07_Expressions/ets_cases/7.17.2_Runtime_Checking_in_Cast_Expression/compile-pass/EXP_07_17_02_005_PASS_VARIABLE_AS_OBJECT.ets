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
 * @id EXP_07_17_02_005_PASS_VARIABLE_AS_OBJECT
 * @expect compile-pass
 * @section 7.17.2
 * @design 验证 string 类型变量 as Object 编译通过（始终成功）
 * @note 正向用例：s as Object (string→Object) 是安全的向上转型
 */
function foo(s: string): void {
    let o: Object = s as Object
}
