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
/*
 * @id NSM_13_07_2_006_PASS_EXPORT_DEFAULT_EXPRESSION
 * @expect compile-pass
 * @section 13.7.2
 * @design export default expression (new A) creates const variable
 * @note spec example: class A {}; export default new A
 *             — this creates an anonymous constant variable
 *             A must be exported for es2panda (D类不一致:
 *             Spec认为未导出A时export default new A合法,
 *             es2panda要求A也必须导出 → 另见NSM_13_07_2_007)
 */

export class A {
    foo(): void {}
}

export default new A
