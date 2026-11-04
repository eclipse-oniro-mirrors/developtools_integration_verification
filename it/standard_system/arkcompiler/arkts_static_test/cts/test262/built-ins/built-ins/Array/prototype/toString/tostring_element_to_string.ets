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

// arktsid: tostring_element_to_string
// description: Each element is converted to a string before being joined

function main(): void {
    let s1: string[] = ['', '', ''];
    arktest.assertEQ(s1.toString(), ',,', 'empty strings joined');

    let s2: string[] = ['\\', '\\', '\\'];
    arktest.assertEQ(s2.toString(), '\\,\\,\\', 'backslashes joined');

    let s3: string[] = ['&', '&', '&'];
    arktest.assertEQ(s3.toString(), '&,&,&', 'ampersands joined');

    let b: boolean[] = [true, true, true];
    arktest.assertEQ(b.toString(), 'true,true,true', 'booleans joined');

    let inf: number[] = [Infinity, Infinity, Infinity];
    arktest.assertEQ(inf.toString(), 'Infinity,Infinity,Infinity', 'Infinity joined');

    let nan: number[] = [NaN, NaN, NaN];
    arktest.assertEQ(nan.toString(), 'NaN,NaN,NaN', 'NaN joined');
}