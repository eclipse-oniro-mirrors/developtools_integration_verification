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
 * @id TYP_03_19_03_007_FAIL_KEYOF_NON_CLASS
 * @expect compile-fail
 * @section 3.19.3
 * @design keyof 应用于非类/接口类型应产生编译时错误
 * @note 反向用例：spec 3.19.3 规定 typeReference 非 class/interface 应报错
 *       ⚠️ SPEC 不一致：ArkTS 实际允许 keyof number 编译通过
 *       分类：D 类（Spec 与实现不一致）
 */
type WrongKeyof = keyof number