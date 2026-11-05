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
 * @id AMB_14_02_001_PASS_BASIC_VOID
 * @expect compile-pass
 * @section 14.2
 * @design declare function 基本声明，有返回类型 void，无函数体，无默认值参数
 * @note 正向用例：验证 ambient function 声明返回 void 编译通过
 */
declare function foo(x: int): void
