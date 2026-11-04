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
// arktsid: math_acosh_nan_returns
// description: Math.acosh(NaN) and x<1 return NaN

function main(): void {
    arktest.assertTrue(isNaN(Math.acosh(NaN)), 'NaN');
    arktest.assertTrue(isNaN(Math.acosh(0.999999)), '0.999999');
    arktest.assertTrue(isNaN(Math.acosh(0)), '0');
    arktest.assertTrue(isNaN(Math.acosh(-1)), '-1');
    arktest.assertTrue(isNaN(Math.acosh(-Infinity)), '-Infinity');
}