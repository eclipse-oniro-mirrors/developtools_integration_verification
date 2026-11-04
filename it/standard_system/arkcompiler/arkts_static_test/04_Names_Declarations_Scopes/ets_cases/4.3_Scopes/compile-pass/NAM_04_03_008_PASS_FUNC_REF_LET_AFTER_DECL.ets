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
 * @id NAM_04_03_008_PASS_FUNC_REF_LET_AFTER_DECL
 * @expect compile-pass
 * @section 4.3
 * @design 函数 hoisting 可引用声明点之后的 let 变量
 * @note 正向用例：函数在整个模块作用域可访问，
 *       函数体内引用声明点之后的 let 变量是合法的
 */
function earlyRef(): number {
    return lateVar;
}
let lateVar: number = 42;
