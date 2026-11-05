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
// arktsid: number_numeric_literal_tostring_default_radix
// description: If radix is undefined the Number 10 is used as the value of radix.

function main(): void {
    arktest.assertEQ(0.0.toString(), '0', '');
    arktest.assertEQ(1.0.toString(), '1', '');
    arktest.assertEQ(NaN.toString(), 'NaN', '');
    arktest.assertEQ(Infinity.toString(), 'Infinity', '');
}