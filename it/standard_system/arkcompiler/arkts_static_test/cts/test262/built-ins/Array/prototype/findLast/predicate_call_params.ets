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

// arktsid: findLast_predicate_call_params
// description: Array.prototype.findLast predicate receives value, index and the original array
// Conversion notes: JS 用 arguments 对象内省回调收到的参数；ArkTS 回调是静态强类型签名，参数个数与类型由类型系统保证，改用命名参数直接引用，测试点（回调收到 value/index/array 或
// prev/cur/idx/array）保留。

function main(): void {
    let arr: string[] = ['Mike', 'Rick', 'Leo'];
    let vals: string[] = [];
    let idxs: int[] = [];
    let sameArray: boolean = true;
    arr.findLast((v: string, k: int, o: string[]): boolean => {
        if (o !== arr) { sameArray = false; }
        vals.push(v);
        idxs.push(k);
        return false;
    });
    arktest.assertEQ(vals.length, 3, 'predicate called 3 times');
    arktest.assertTrue(sameArray, '3rd arg is the original array');
    arktest.assertEQ(vals[0], 'Leo');  arktest.assertEQ(idxs[0], 2);
    arktest.assertEQ(vals[1], 'Rick'); arktest.assertEQ(idxs[1], 1);
    arktest.assertEQ(vals[2], 'Mike'); arktest.assertEQ(idxs[2], 0);
}