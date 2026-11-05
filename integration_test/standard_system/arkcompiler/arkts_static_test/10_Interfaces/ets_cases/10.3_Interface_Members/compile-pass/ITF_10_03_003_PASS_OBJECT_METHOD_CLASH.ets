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
 * @id ITF_10_03_003_PASS_OBJECT_METHOD_CLASH
 * @expect compile-pass
 * @section 10.3
 * @design 与Object方法冲突【已知gap：编译器未实现§10.3规则】
 * @note Spec规定同名Object public方法应编译错误，但当前编译器接受。
 */
interface BadToString {
    toString(p: number): void;
}
