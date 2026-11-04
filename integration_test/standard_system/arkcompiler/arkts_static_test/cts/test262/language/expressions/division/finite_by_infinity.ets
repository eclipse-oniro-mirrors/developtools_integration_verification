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

// arktsid: finite_by_infinity
// description: Division of a finite value by infinity produces a signed zero

function main(): void {
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    arktest.assertEQ(1.0 / (1.0 / negativeInfinity), negativeInfinity, 'positive one by negative infinity');
    arktest.assertEQ(1.0 / (-1.0 / negativeInfinity), positiveInfinity, 'negative one by negative infinity');
    arktest.assertEQ(1.0 / (1.0 / positiveInfinity), positiveInfinity, 'positive one by positive infinity');
    arktest.assertEQ(1.0 / (-1.0 / positiveInfinity), negativeInfinity, 'negative one by positive infinity');
}

