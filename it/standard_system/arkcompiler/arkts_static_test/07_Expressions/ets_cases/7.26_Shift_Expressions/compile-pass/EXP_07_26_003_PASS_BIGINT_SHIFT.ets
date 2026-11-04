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
 * @id EXP_07_26_003_PASS_BIGINT_SHIFT
 * @expect compile-pass
 * @section 7.26
 * @design bigint 类型移位运算符（<<, >>）编译通过验证，bigint 不支持 >>>
 * @note 正向用例：验证 bigint 在 << 和 >> 运算中编译通过
 *       >>> 用于 bigint 应为编译时错误
 */
function main(): void {
    let a: bigint = 16n;
    let b: bigint = 2n;

    // 左移
    let left: bigint = a << b;
    // 带符号右移
    let signedRight: bigint = a >> b;

    // 字面量移位
    let l1: bigint = 8n << 3n;
    let l2: bigint = 8n >> 2n;

    console.log('result left: ' + left);
    console.log('result signedRight: ' + signedRight);
}
