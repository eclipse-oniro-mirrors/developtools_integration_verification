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
 * @id CLS_09_03_2_004_FAIL_NON_OPTIONAL_IMPL_OPTIONAL
 * @expect compile-fail
 * @section 9.3.2
 * @design 非可选字段实现可选属性导致编译错�?
 * @note 反向用例：spec规定可选属性必须由可选字段实�?
 */
interface IOpt4 {
  num?: number
}
class CNonOpt implements IOpt4 {
  num: number = 42
}
