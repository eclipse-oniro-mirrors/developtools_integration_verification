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
 * @id CCY_16_01_006_PASS_zero_suspension_points
 * @expect compile-pass
 * @section 16.1
 * @design job 可以没有悬挂点（同步函数）
 * @note 正向用例：普通函数没有悬挂点，执行不中断
 */
function noSuspension(): number {
    let x: number = 1;
    let y: number = 2;
    return x + y;
}

function main(): void {
    let r: number = noSuspension();
    console.log(r.toString());
}
