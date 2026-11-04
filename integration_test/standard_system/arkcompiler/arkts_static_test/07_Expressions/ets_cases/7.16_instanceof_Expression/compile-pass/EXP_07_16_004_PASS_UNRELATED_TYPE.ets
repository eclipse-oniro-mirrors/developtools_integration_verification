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
 * @id EXP_07_16_004_PASS_UNRELATED_TYPE
 * @expect compile-pass
 * @section 7.16
 * @design 验证无继承关系类型 instanceof 编译通过（运行时为 false）
 * @note 正向用例：不相关类型 instanceof 语法检查
 */
class A {}
class B {}

let a = new A()
let r: boolean = a instanceof B
