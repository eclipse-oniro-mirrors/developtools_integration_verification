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
 * @id GEN_05_01_03_010_PASS_CALLBACK_RETURN_INTERLEAVING
 * @expect compile-pass
 * @section 5.1.3
 * @design in T 在回调函数返回值位置经 variance interleaving 计算后合法
 * @note 正向用例：supplier 为方法参数（in-position），T 为返回值（out-position），in+out=in，符合 in T
 */
class Consumer<in T> {
    produce(supplier: () => T): void {}
}
