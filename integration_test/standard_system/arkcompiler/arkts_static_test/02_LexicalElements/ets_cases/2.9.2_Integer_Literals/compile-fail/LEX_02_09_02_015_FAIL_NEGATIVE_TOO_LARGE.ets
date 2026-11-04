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
 * @id LEX_02_09_02_015_FAIL_NEGATIVE_TOO_LARGE
 * @expect compile-fail
 * @section 2.9.2
 * @design int 类型赋值超出负数范围
 * @note compile-fail 用例：验证编译器拒绝 int 范围外的负数赋值
 */

// int 类型赋值超出负数范围，编译失败
const err: int = -2147483649
