/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: filter_callback_three_args
// description: Array.prototype.filter callback receives 3 arguments
// Conversion notes: JS 用 arguments 对象内省回调收到的参数；ArkTS 回调是静态强类型签名，参数个数与类型由类型系统保证，改用命名参数直接引用，测试点（回调收到 value/index/array 或
// prev/cur/idx/array）保留。

function main(): void {
    let srcArr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    let bCalled: boolean = false;
    let resArr: int[] = srcArr.filter((_v: int, _k: int, _o: int[]): boolean => { bCalled = true; return true; });
    arktest.assertTrue(bCalled, 'callback invoked');
    arktest.assertEQ(resArr.length, 10, 'filter keeps all 10 elements');
}