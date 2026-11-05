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
 * @id NAM_04_05_010_PASS_TYPE_DECL_ENUM
 * @expect compile-pass
 * @section 4.5
 * @design enum declaration 是类型声明
 * @note 正向用例：验证 enum 声明引入可用于变量类型注解的类型名
 */
enum TypeDeclaredEnum { One, Two }
let typeDeclaredEnumValue: TypeDeclaredEnum = TypeDeclaredEnum.One;
