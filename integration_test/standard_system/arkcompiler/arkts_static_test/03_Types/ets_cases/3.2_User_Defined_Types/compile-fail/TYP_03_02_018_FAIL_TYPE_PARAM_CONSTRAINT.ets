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
 * @id TYP_03_02_018_FAIL_TYPE_PARAM_CONSTRAINT
 * @expect compile-fail
 * @section 3.2
 * @design 类型参数超出约束: 泛型实例化类型不满足 extends 约束应编译失败
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Base {
  baseMethod(): void {}
}

class G<T extends Base> {
  field: T
  constructor(f: T) {
    this.field = f
  }
}

function testTypeParamConstraintFail(): void {
  let g: G<Base> = new G<Base>(new Base())
  let g2: G<Object> = new G<Object>(new Object())
}