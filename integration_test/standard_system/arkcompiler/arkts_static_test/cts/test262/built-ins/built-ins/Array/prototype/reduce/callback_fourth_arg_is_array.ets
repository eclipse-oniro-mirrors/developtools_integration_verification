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

// arktsid: reduce_callback_fourth_arg_is_array
// description: Array.prototype.reduce callback 4th argument is the array
// Conversion notes: JS 用 arguments 对象内省回调收到的参数；ArkTS 回调是静态强类型签名，参数个数与类型由类型系统保证，改用命名参数直接引用，测试点（回调收到 value/index/array 或
// prev/cur/idx/array）保留。

function main(): void {
    let result: boolean = false;
    let arr: int[] = [11];
    arr.reduce((prev: int, cur: int, idx: int, o: int[]): int => {
        result = (prev === 1 && o[idx] === cur);
        return cur;
    }, 1);
    arktest.assertTrue(result, '4th arg is the array');
}