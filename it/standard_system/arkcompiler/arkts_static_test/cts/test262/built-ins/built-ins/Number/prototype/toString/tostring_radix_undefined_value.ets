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
// arktsid: number_tostring_radix_undefined_value
// description: Passing undefined as radix behaves like the default radix 10

function main(): void {
    // explicit undefined radix is equivalent to omitting the argument (default radix 10)
    arktest.assertEQ(0.0.toString(), '0', 'Number.prototype.toString(undefined)');
    arktest.assertEQ(0.0.toString(), '0', 'new Number().toString(undefined)');
    arktest.assertEQ(0.0.toString(), '0', 'new Number(0).toString(undefined)');
    arktest.assertEQ((-1).toString(), '-1', 'new Number(-1).toString(undefined)');
    arktest.assertEQ((1).toString(), '1', 'new Number(1).toString(undefined)');
    arktest.assertEQ(NaN.toString(), 'NaN', 'new Number(NaN).toString(undefined)');
    arktest.assertEQ(Infinity.toString(), 'Infinity', 'new Number(Infinity).toString(undefined)');
    arktest.assertEQ((-Infinity).toString(), '-Infinity', 'new Number(-Infinity).toString(undefined)');
}