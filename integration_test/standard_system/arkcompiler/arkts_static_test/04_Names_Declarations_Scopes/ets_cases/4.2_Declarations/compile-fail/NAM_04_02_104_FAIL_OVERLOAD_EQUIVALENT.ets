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
 * @id NAM_04_02_104_FAIL_OVERLOAD_EQUIVALENT
 * @expect compile-fail
 * @section 4.2
 * @design 重载等价签名
 * @note 反向用例：验证重载等价签名编译错误（参数名不同但类型相同）
 */
function foo(x: number): void {}
function foo(y: number): void {}
