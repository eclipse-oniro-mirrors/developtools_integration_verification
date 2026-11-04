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
// arktsid: math_floor_equals_negative_ceil
// description: Math.floor(x) equals -Math.ceil(-x) for 2000 floating point values

function main(): void {
    for (let i: int = -1000; i < 1000; i++) {
        let x: double = i / 10.0;
        arktest.assertEQ(Math.floor(x), -Math.ceil(-x), 'Math.floor(x) = -Math.ceil(-x)');
    }
}