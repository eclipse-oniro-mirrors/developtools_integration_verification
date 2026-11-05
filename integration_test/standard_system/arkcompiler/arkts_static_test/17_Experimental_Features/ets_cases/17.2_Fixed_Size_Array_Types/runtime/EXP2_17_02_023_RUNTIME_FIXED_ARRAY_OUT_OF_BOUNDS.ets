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
 * @id EXP2_17_02_023_RUNTIME_FIXED_ARRAY_OUT_OF_BOUNDS
 * @expect runtime
 * @section 17.2
 * @design FixedArray 越界访问抛出错误
 * @note 运行时用例：验证索引越界访问（>= length 或 < 0）抛出运行时错误
 *       ⚠️ SPEC 不一致：编译器 ESE0247 在编译期拒绝负索引常量（a[-1]），实现比 spec 更严格
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
    let arr: Fixedint[] = [1, 2, 3];
    let outOfBoundsCaught: boolean = false;

    try {
        let val: int = arr[5];
    } catch (e) {
        outOfBoundsCaught = true;
    }
    if (!outOfBoundsCaught) {
        throw new Error('assertion failed: out-of-bounds access at index 5 did not throw');
    }

    let negativeIndexCaught: boolean = false;
    try {
        let val: int = arr[-1];
    } catch (e) {
        negativeIndexCaught = true;
    }
    if (!negativeIndexCaught) {
        throw new Error('assertion failed: negative index access at -1 did not throw');
    }

    console.log('verified');
}
