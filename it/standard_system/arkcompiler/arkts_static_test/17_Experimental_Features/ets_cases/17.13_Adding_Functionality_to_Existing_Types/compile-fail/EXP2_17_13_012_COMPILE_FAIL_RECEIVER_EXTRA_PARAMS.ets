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
 * @id EXP2_17_13_012_COMPILE_FAIL_RECEIVER_EXTRA_PARAMS
 * @expect compile-fail
 * @section 17.13
 * @design 验证 receiver 函数多余 this 参数——应报编译错误
 * @note 反向用例：receiver 函数只能有一个 this 参数，多余的应报错
 */
class C { public x: int = 0 }
function bad(this: C, this: C): void {}

function main(): void {}
