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
 * @id TYP_03_02_007_PASS_TYPE_PARAM_CLASS
 * @expect compile-pass
 * @section 3.2
 * @design 类型参数: 泛型类 class G<T> 声明、实例化、类型参数约束 extends
 * @note 正向用例：验证泛型类
 *       注：1) 类名避开 stdlib 已有的 Box；2) 局部类移到顶层
 */
class MyBox<T> {
  value: T
  constructor(v: T) {
    this.value = v
  }
  get(): T {
    return this.value
  }
}

class Constrained<T extends Object> {
  field: T
  constructor(f: T) {
    this.field = f
  }
}

function testTypeParamClass(): void {
  let bi: MyBox<int> = new MyBox<int>(42)
  let vi: int = bi.get()

  let bs: MyBox<string> = new MyBox<string>("hello")
  let vs: string = bs.get()

  let co: Constrained<Object> = new Constrained<Object>(new Object())
}