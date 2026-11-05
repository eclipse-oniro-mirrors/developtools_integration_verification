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
// arktsid: s13_a4_t3
// description: Declaring a function that uses arithmetical operators within its "return" Expression

function f(arg1: number, arg2: number, arg3: number): number {
    return arg1 += (arg2 += arg3);
}

function main(): void {
    arktest.assertTrue(typeof f === 'function');
    arktest.assertEQ(f(10, 20, 30), 60);
}
