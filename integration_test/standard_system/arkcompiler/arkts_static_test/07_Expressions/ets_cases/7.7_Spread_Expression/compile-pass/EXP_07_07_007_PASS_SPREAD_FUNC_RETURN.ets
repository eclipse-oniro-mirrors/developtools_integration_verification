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
 * @id EXP_07_07_007_PASS_SPREAD_FUNC_RETURN
 * @expect compile-pass
 * @section 7.7
 * @design 函数返回值扩展：foo(...g1())，g1 返回数组
 * @note 正向用例：验证函数调用返回值的扩展
 */
function g1(): int[] {
    return [1, 2]
}
function foo(...p: int[]): void {}
foo(...g1())
