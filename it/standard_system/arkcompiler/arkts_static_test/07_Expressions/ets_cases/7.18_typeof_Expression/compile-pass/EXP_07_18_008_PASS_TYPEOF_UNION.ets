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
 * @id EXP_07_18_008_PASS_TYPEOF_UNION
 * @expect compile-pass
 * @section 7.18
 * @design 验证 typeof union 类型编译通过
 * @note 正向用例：typeof p (A|B union) 编译通过，值运行时确定
 */
class A { public a: int = 0}
class B { public b: int = 0}

function testUnion(p: A | B): void {
    let t: string = typeof p
}
