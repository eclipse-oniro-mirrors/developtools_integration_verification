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
// arktsid: number_string_exp_signed
// description: Compare Number('12345e6') with +('12345')*1e1, and Number('12345e-6') !== Number('12345')*1e-6

function main(): void {
    arktest.assertEQ(Number('12345e6'), 12345000000, 'Number("12345e6") must return 12345000000');
    arktest.assertEQ(Number('12345e-6'), 0.012345, 'Number("12345e-6") must return 0.012345');
}