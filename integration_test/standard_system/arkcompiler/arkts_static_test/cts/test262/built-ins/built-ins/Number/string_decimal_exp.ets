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
// arktsid: number_string_decimal_exp
// description: Compare Number('.12345e6') with +('12345')*1e1, and Number('.12345e-3') !== Number('12345')*1e-8

function main(): void {
    arktest.assertEQ(Number('12345')*1e1, 0.12345e6, '');
    arktest.assertEQ(Number('.12345e-3'), 0.00012345, '');
}