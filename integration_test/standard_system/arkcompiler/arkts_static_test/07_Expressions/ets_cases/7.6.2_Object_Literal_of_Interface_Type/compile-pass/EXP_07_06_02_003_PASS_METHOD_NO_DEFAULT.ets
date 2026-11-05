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
 * @id EXP_07_06_02_003_PASS_METHOD_NO_DEFAULT
 * @expect compile-pass
 * @section 7.6.2
 * @design 实现无默认实现的接口方法：print_name 无默认实现，对象字面量中必须提供
 * @note 正向用例：验证无默认实现的方法必须在对象字面量中提供实现
 */
interface I {
    print_name(name: string): void
}
let i: I = {
    print_name(name: string): void {}
}
