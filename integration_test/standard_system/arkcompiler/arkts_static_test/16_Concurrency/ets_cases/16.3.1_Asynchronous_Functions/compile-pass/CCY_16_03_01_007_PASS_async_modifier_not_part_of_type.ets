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
 * @id CCY_16_03_01_007_PASS_async_modifier_not_part_of_type
 * @expect compile-pass
 * @section 16.3.1
 * @design async 修饰符不是函数类型的一部分
 * @note 正向用例：验证 async 和非 async 函数签名相同时类型系统无区别
 *       spec: "a non-async function that returns Promise and an async function
 *       with the same return type and arguments are no different"
 */
type FnType = () => Promise<number>;
let f1: FnType = async () => { return 42 as number; };
let f2: FnType = () => { return Promise.resolve<number>(42); };
