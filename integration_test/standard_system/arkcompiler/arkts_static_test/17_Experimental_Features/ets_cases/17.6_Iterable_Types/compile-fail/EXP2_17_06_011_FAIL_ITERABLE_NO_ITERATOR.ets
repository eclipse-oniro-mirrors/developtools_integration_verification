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
 * @id EXP2_17_06_011_FAIL_ITERABLE_NO_ITERATOR
 * @expect compile-fail
 * @section 17.6
 * @design 类声明 implements Iterable<T> 但未定义 $_iterator() 方法，应产生编译时错误
 * @note 反向用例：验证缺少 $_iterator 方法应产生编译时错误
 */
class NoIterMethod implements Iterable<number> {
  private val: number
  constructor(v: number) {
    this.val = v
  }
}
