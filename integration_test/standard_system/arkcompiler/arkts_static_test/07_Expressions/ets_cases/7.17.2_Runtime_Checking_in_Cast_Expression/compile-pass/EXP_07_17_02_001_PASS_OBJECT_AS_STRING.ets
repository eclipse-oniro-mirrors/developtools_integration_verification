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
 * @id EXP_07_17_02_001_PASS_OBJECT_AS_STRING
 * @expect compile-pass
 * @section 7.17.2
 * @design 验证 Object 类型变量 as string 运行时检查编译通过
 * @note 正向用例：x as string 是合法的运行时 cast 表达式
 */
function foo(x: Object): void {
    let s: string = x as string
}
