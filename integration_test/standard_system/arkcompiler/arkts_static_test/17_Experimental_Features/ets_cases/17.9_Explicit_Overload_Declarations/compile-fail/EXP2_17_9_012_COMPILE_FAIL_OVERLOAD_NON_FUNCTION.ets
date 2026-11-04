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
 * @id EXP2_17_9_012_COMPILE_FAIL_OVERLOAD_NON_FUNCTION
 * @expect compile-fail
 * @section 17.9
 * @design 验证 overload 修饰非函数实体——应报编译错误
 * @note 反向用例：overload 关键字只能修饰函数/方法/构造器，修饰变量应报错
 */
let x: int = 0
overload function broken(a: int): void {}
overload function broken(a: string): void {}

function main(): void {}
