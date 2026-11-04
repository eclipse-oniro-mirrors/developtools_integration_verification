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
 * @id ITF_10_04_02_100_FAIL_OPTIONAL_NOT_ASSIGNED
 * @expect compile-fail
 * @section 10.4.2
 * @design 类未实现可选属性不报错，但如果使用时未正确处理应为编译错误
 * @note 反向用例：验证可选属性未赋值时直接使用可能出错
 */
interface Config {
    required: string;
    optional?: string;
}
function test(c: Config): void {
    let s: string = c.optional;
}
