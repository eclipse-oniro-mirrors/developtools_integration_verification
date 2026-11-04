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
// arktsid: math_trunc_sample_tests
// description: Math.trunc sample tests: small fractions -> +/-0, large ints -> identity
// Conversion notes: Number.EPSILON/MIN_VALUE/MAX_VALUE mapped to Double.EPSILON/MIN_VALUE/MAX_VALUE (ArkTS uses Double
// constants).

function main(): void {
    arktest.assertEQ(1.0 / Math.trunc(0.02047410048544407), Infinity, 'trunc(0.0204) is +0');
    arktest.assertEQ(1.0 / Math.trunc(0.00000000000000001), Infinity, 'trunc(1e-17) is +0');
    arktest.assertEQ(1.0 / Math.trunc(0.9999999999999999), Infinity, 'trunc(0.999..) is +0');
    arktest.assertEQ(1.0 / Math.trunc(Double.EPSILON), Infinity, 'trunc(EPSILON) is +0');
    arktest.assertEQ(1.0 / Math.trunc(Double.MIN_VALUE), Infinity, 'trunc(MIN_VALUE) is +0');
    arktest.assertEQ(1.0 / Math.trunc(-0.02047410048544407), -Infinity, 'trunc(-0.0204) is -0');
    arktest.assertEQ(1.0 / Math.trunc(-0.00000000000000001), -Infinity, 'trunc(-1e-17) is -0');
    arktest.assertEQ(1.0 / Math.trunc(-0.9999999999999999), -Infinity, 'trunc(-0.999..) is -0');
    arktest.assertEQ(1.0 / Math.trunc(-Double.EPSILON), -Infinity, 'trunc(-EPSILON) is -0');
    arktest.assertEQ(1.0 / Math.trunc(-Double.MIN_VALUE), -Infinity, 'trunc(-MIN_VALUE) is -0');
    arktest.assertEQ(Math.trunc(Double.MAX_VALUE), Math.floor(Double.MAX_VALUE), 'trunc(MAX)=floor(MAX)');
    arktest.assertEQ(Math.trunc(10), Math.floor(10), 'trunc(10)=floor(10)');
    arktest.assertEQ(Math.trunc(3.9), Math.floor(3.9), 'trunc(3.9)=floor(3.9)');
    arktest.assertEQ(Math.trunc(4.9), Math.floor(4.9), 'trunc(4.9)=floor(4.9)');
    arktest.assertEQ(Math.trunc(-Double.MAX_VALUE), Math.ceil(-Double.MAX_VALUE), 'trunc(-MAX)=ceil(-MAX)');
    arktest.assertEQ(Math.trunc(-10), Math.ceil(-10), 'trunc(-10)=ceil(-10)');
    arktest.assertEQ(Math.trunc(-3.9), Math.ceil(-3.9), 'trunc(-3.9)=ceil(-3.9)');
    arktest.assertEQ(Math.trunc(-4.9), Math.ceil(-4.9), 'trunc(-4.9)=ceil(-4.9)');
}