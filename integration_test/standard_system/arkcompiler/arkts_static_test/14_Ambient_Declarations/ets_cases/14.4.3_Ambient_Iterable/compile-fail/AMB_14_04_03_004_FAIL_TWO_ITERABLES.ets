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
 * @id AMB_14_04_03_004_FAIL_TWO_ITERABLES
 * @expect compile-fail
 * @section 14.4.3
 * @design declare class 中两个 iterable 声明，违反"仅允许一个"规则
 * @note 反向用例：两个 iterable 应产生编译时错误
 */
declare class Bad {
  [Symbol.iterator](): Iterator<int>
  [Symbol.iterator](): Iterator<string>
}
