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
 * @id AMB_14_04_03_001_PASS_BASIC_ITERABLE
 * @expect compile-pass
 * @section 14.4.3
 * @design declare class 中 [Symbol.iterator]() 声明，返回 Iterator<int>
 * @note 正向用例：验证 ambient iterable 编译通过
 */
declare class C {
  [Symbol.iterator](): Iterator<int>
}
