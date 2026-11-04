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
 * @id CCY_16_03_05_008_PASS_promise_race
 * @expect compile-pass
 * @section 16.3.5
 * @design Promise.race 静态组合子
 * @note 正向用例：验证 Promise.race 通过编译
 */
function main(): void {
    let p1: Promise<number> = new Promise<number>((resolve: (v: number) => void) => {});
    let p2: Promise<number> = Promise.resolve<number>(2);
    let race: Promise<number> = Promise.race([p1, p2]);
}
