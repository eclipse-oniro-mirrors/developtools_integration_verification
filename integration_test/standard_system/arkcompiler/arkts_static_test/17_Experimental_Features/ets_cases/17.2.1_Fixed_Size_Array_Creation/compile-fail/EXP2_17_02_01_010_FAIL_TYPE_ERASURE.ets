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
 * @id EXP2_17_02_01_010_FAIL_TYPE_ERASURE
 * @expect compile-fail
 * @section 17.2.1
 * @design FixedArray 元素类型 T 未被类型擦除保留：构造函数中使用类型参数 T 作为元素类型应产生编译时错误
 * @note 反向用例：验证该场景应产生编译时错误。类型参数不被类型擦除保留，故 new FixedT[](...) 非法
 */
class Container<T> {
  public item: T
  constructor(val: T) {
    this.item = val
  }
  makeArray(): void {
    let arr = new FixedT[](3, this.item)
    console.log(arr.length)
  }
}
