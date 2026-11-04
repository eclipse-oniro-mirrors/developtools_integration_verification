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
 * @id EXP2_17_12_014_FAIL_INVALID_SYNTAX
 * @expect compile-fail
 * @section 17.12
 * @design 默认方法声明语法不完整（方法体缺少闭合大括号），应产生语法错误
 * @note 反向用例：默认方法声明必须有完整的方法体块
 */
interface IBadSyntax {
  compute(x: int): int {
    return x * 2
  // 语法错误：缺少闭合大括号 '}'
}
