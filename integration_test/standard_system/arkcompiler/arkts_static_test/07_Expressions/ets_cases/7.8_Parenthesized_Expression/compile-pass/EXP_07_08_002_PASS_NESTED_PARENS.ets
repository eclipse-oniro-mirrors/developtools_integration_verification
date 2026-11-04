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
 * @id EXP_07_08_002_PASS_NESTED_PARENS
 * @expect compile-pass
 * @section 7.8
 * @design 多层嵌套括号：(((1 + 2))) 验证多层括号嵌套编译通过
 * @note 正向用例：验证嵌套括号表达式
 */
let x: int = (((1 + 2)))
