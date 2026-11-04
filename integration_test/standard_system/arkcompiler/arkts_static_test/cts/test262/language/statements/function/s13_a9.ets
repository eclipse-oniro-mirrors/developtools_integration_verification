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
// arktsid: s13_a9
// description: Using function as argument of another function

function inc(arg: number): number {
    return arg + 1;
}

function mult(incrementator: (x: number) => number, arg: number, m: number): number {
    return incrementator(arg) * m;
}

function main(): void {
    arktest.assertEQ(mult(inc, 2, 2), 6);
}
