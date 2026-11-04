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
 * @id GEN_05_01_03_009_PASS_CALLBACK_PARAM_INTERLEAVING
 * @expect compile-pass
 * @section 5.1.3
 * @design out T 在回调函数参数位置经 variance interleaving 计算后合法
 * @note 正向用例：callback 为方法参数（in-position），T 为 callback 参数（in-position），in+in=out，符合 out T
 */
class Container<out T> {
    constructor(v: T) {}
    forEach(callback: (item: T) => void): void {}
}
