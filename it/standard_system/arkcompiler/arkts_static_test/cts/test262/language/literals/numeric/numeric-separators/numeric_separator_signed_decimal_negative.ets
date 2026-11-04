/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

// arktsid: numeric_separator_signed_decimal_negative
// description: Negative signed decimal digits with a numeric separator

function main(): void {


    arktest.assertEQ(-123456789_0, -1234567890);
    arktest.assertEQ(-123456789_1, -1234567891);
    arktest.assertEQ(-123456789_2, -1234567892);
    arktest.assertEQ(-123456789_3, -1234567893);
    arktest.assertEQ(-123456789_4, -1234567894);
    arktest.assertEQ(-123456789_5, -1234567895);
    arktest.assertEQ(-123456789_6, -1234567896);
    arktest.assertEQ(-123456789_7, -1234567897);
    arktest.assertEQ(-123456789_8, -1234567898);
    arktest.assertEQ(-123456789_9, -1234567899);

}