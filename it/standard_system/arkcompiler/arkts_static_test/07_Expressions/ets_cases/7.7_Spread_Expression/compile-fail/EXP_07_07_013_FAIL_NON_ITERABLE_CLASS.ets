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
 * @id EXP_07_07_013_FAIL_NON_ITERABLE_CLASS
 * @expect compile-fail
 * @section 7.7
 * @design 非 iterable 类类型扩展：未实现 Iterable 接口的类，扩展编译时错误
 * @note 反向用例：验证非 iterable 类型扩展应报编译时错误
 */
class Data {
    public value: int = 0
}
let d: Data = new Data()
let result: int[] = [...d]
