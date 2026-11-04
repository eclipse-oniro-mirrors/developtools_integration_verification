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
// arktsid: s13_2_1_a5_t2
// description: Returning a function that approximates the derivative of f  using an interval of dx, which should be
// appropriately small

function derivative(f: (x: number) => number, dx: number): (x: number) => number {
    return (x: number): number => {
        return (f(x + dx) - f(x)) / dx;
    };
}

function main(): void {
    let sinRef: (x: number) => number = Math.sin;
    let d0: number = derivative(sinRef, 0.0001)(0);
    let d2pi: number = derivative(sinRef, 0.0001)(2 * Math.PI);
    arktest.assertTrue(Math.abs(d0 - d2pi) < 1 / 65536.0);
}