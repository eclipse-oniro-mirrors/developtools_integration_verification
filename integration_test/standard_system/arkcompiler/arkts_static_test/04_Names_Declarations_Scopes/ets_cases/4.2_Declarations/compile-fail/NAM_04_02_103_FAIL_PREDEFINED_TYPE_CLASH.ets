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
 * @id NAM_04_02_103_FAIL_PREDEFINED_TYPE_CLASH
 * @expect compile-fail
 * @section 4.2
 * @design 预定义类型名冲突
 * @note 反向用例：验证预定义类型名做变量名编译错误
 */
let number: number = 1;
let String: boolean = true;
function Record(): void {}
interface Object {}
let Array: number = 42;
