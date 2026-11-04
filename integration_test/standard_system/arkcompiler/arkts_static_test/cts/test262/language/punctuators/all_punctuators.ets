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

// arktsid: all-punctuators
// description: Correct interpretation of all punctuators

function main(): void {
    let emptyObject: Object = {};
    let emptyArray: int[] = [];
    let comparison1: boolean = 1 < 2;
    let comparison2: boolean = 2 > 1;
    let comparison3: boolean = 1 <= 2;
    let comparison4: boolean = 2 >= 1;
    let equality1: boolean = 1 == 1;
    let equality2: boolean = 1 != 2;
    let equality3: boolean = 1 === 1;
    let equality4: boolean = 1 !== 2;
    let arithmetic: double = 1.0 + 2.0 - 3.0 * 4.0 % 5.0 / 6.0;
    let shifted: int = (1 << 2) >> 1 >>> 0;
    let unary: double = 0.0;
    unary++;
    ++unary;
    unary--;
    --unary;
    let bitwise: int = (1 & 2) | (3 ^ 4);
    let logical: boolean = (true && !false) || (~0 == -1);
    let conditional: int = true ? 2 : 3;
    let assigned: int = 1;
    assigned += 2;
    assigned -= 3;
    assigned *= 4;
    assigned /= 5;
    assigned %= 6;
    assigned <<= 1;
    assigned >>= 1;
    assigned >>>= 1;
    assigned &= 1;
    assigned |= 2;
    assigned ^= 3;
        arktest.assertTrue(emptyObject != null && emptyArray.length == 0 && comparison1 && comparison2 && comparison3 &&
            comparison4 && equality1 && equality2 && equality3 && equality4 && shifted == 2 && arithmetic != 0.0 &&
            logical && conditional == 2 && bitwise >= 0 && assigned >= 0,
        'all punctuators remain valid');
}