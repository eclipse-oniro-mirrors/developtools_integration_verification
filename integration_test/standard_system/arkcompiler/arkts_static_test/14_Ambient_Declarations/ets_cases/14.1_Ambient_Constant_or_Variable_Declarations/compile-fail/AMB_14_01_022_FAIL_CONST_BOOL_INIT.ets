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
 * @id AMB_14_01_022_FAIL_CONST_BOOL_INIT
 * @expect compile-fail
 * @section 14.1
 * @design declare const 布尔初始化器，违反 spec：ambient 常量不能有初始化器（无论类型）
 * @note 反向用例：验证 ambient const 声明带布尔初始化器应产生编译时错误
 *       ⚠️ SPEC 不一致：spec 要求报报错，但 ArkTS 实际编译通过
 *       原 D 类不一致已于编译器更新后消除
 */
declare const c = false
