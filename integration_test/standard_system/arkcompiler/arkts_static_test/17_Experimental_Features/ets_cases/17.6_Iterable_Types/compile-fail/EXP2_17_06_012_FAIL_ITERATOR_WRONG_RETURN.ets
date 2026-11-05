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
 * @id EXP2_17_06_012_FAIL_ITERATOR_WRONG_RETURN
 * @expect compile-fail
 * @section 17.6
 * @design $_iterator() 方法返回类型不是 Iterator<T> 的子类型，应产生编译时错误
 * @note 反向用例：验证 $_iterator 返回错误类型应产生编译时错误
 */
class WrongReturnIterable implements Iterable<string> {
  private msg: string
  constructor(m: string) {
    this.msg = m
  }
  $_iterator(): string {
    return this.msg
  }
}
