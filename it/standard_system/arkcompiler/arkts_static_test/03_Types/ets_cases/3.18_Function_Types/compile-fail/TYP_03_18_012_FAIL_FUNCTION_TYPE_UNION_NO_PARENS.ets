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
 * @id TYP_03_18_012_FAIL_FUNCTION_TYPE_UNION_NO_PARENS
 * @expect compile-fail
 * @section 3.18
 * @design 函数类型在联合类型中未加括号包裹，spec 3.18 明确规定应产生编译时错误
 * @note 反向用例：spec 3.18 规定 "A compile-time error occurs if type is a function
 *       type not enclosed in parentheses"，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求报错，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
// spec 3.18 规定：联合类型中函数类型必须用括号包裹，否则 compile-time error
// 实际行为：ArkTS 编译器允许不加括号，编译通过
type BadUnion = string | (x: int) => int