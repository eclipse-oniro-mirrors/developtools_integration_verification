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
// arktsid: math_round_equals_floor_plus_half
// description: Math.round(x) equals Math.floor(x+0.5) for x>=0 and x<-0.5

function main(): void {
    for (let i: int = 0; i <= 1000; i++) {
        let x: double = i / 10.0;
        arktest.assertEQ(Math.round(x), Math.floor(x + 0.5), 'round(x) = floor(x+0.5)');
    }
    for (let i: int = -5; i >= -1000; i--) {
        let x: double = 0.0;
        if (i === -5) {
            x = -0.500000000000001;
        } else {
            x = i / 10.0;
        }
        arktest.assertEQ(Math.round(x), Math.floor(x + 0.5), 'round(x) = floor(x+0.5)');
    }
}