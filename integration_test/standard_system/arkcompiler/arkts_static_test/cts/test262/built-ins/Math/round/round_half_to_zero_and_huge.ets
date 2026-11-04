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
// arktsid: math_round_half_to_zero_and_huge
// description: Math.round in [-0.5,-0] is -0; Math.round of huge integers is identity
// Conversion notes: Number.EPSILON mapped to Double.EPSILON.

function main(): void {
    arktest.assertEQ(1.0 / Math.round(-0.5), -Infinity, 'round(-0.5) is -0');
    arktest.assertEQ(1.0 / Math.round(-0.25), -Infinity, 'round(-0.25) is -0');
    arktest.assertEQ(1.0 / Math.round(-0.0), -Infinity, 'round(-0) is -0');
    let a: double = 0.5 - Double.EPSILON / 4.0;
    arktest.assertEQ(1.0 / Math.round(a), Infinity, 'round(0.5-eps/4) is +0');
    let b: double = -(2.0 / Double.EPSILON - 1.0);
    arktest.assertEQ(Math.round(b), b, 'round(-(2/eps-1))');
    let c: double = -(1.5 / Double.EPSILON - 1.0);
    arktest.assertEQ(Math.round(c), c, 'round(-(1.5/eps-1))');
    let d: double = -(1.0 / Double.EPSILON + 1.0);
    arktest.assertEQ(Math.round(d), d, 'round(-(1/eps+1))');
    let e: double = 1.0 / Double.EPSILON + 1.0;
    arktest.assertEQ(Math.round(e), e, 'round(1/eps+1)');
    let f: double = 1.5 / Double.EPSILON - 1.0;
    arktest.assertEQ(Math.round(f), f, 'round(1.5/eps-1)');
    let g: double = 2.0 / Double.EPSILON - 1.0;
    arktest.assertEQ(Math.round(g), g, 'round(2/eps-1)');
}