/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: s13_2_1_a6_t1
// description: Declaring a function with "function __func(arg1, arg2)"

function f(arg1: number, arg2: string): void {
    arg1 += 1;
    arg2 += 'BA';
}

function main(): void {
    let x: number = 1;
    let y: number = 2;
    let a: string = 'AB';
    let b: string = 'SAM';
    f(x, a);
    f(y, b);
    arktest.assertEQ(x, 1);
    arktest.assertEQ(y, 2);
    arktest.assertEQ(a, 'AB');
    arktest.assertEQ(b, 'SAM');
}
