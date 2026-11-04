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
 * @id NAM_04_02_105_FAIL_OVERLOAD_TYPE_ERASURE
 * @expect compile-fail
 * @section 4.2
 * @design 类型擦除导致重载等价
 * @note 反向用例：验证泛型类型擦除后签名等价编译错误
 */
function bar(x: Array<number>): void {}
function bar(x: Array<string>): void {}
