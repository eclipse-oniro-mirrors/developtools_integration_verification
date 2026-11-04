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
 * @id EXP_07_15_007_PASS_GENERIC_NEW
 * @expect compile-pass
 * @section 7.15
 * @design 验证泛型类带类型参数实例化 new MyBox<int>(42)
 * @note 正向用例：泛型类实例化显式类型参数
 */
class MyBox<T> {
  public val: T
  constructor(v: T) { this.val = v }
}
let b = new MyBox<int>(42)
