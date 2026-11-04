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
 * @id EXP_07_06_02_026_RUNTIME_DEFAULT_METHOD
 * @expect runtime
 * @section 7.6.2
 * @design 验证接口默认方法可以工作：有默认实现的方法在对象字面量中跳过时使用接口实现
 * @note 运行时用例：验证接口的默认方法实现可被对象字面量继承使用
 */
interface I {
    print_something(): void {}
}

function main(): void {
    const i: I = {}
    i.print_something()
    console.log('verified')
}
