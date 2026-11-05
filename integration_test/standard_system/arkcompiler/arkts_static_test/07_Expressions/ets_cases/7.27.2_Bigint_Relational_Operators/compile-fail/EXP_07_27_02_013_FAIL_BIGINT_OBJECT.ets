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
 * @id EXP_07_27_02_013_FAIL_BIGINT_OBJECT
 * @expect compile-fail
 * @section 7.27.2
 * @design bigint 与 Object 类型关系运算产生编译时错误
 * @note 反向用例：验证 bigint > Object 等混合类型被编译器拒绝
 *       Object 不是数值类型，bigint 关系运算符不允许
 */
function main(): void {
    let b: bigint = 2n;
    let o: Object = {};
    let r: boolean = b > o;
    console.log('r: ' + r);
}
