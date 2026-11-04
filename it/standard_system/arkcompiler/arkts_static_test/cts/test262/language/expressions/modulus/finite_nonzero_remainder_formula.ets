/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: finite_nonzero_remainder_formula
// description: Finite non-zero remainder follows x - truncate(x / y) * y

function truncate(value: double): double {
    if (value > 0.0) {
        return Math.floor(value);
    }
    return Math.ceil(value);
}

function main(): void {
    let x: double = 1.3;
    let y: double = 1.1;
    arktest.assertEQ(x % y, 0.19999999999999996);
    arktest.assertEQ(x % y, x - truncate(x / y) * y);

    x = -1.3;
    y = 1.1;
    arktest.assertEQ(x % y, -0.19999999999999996);
    arktest.assertEQ(x % y, x - truncate(x / y) * y);

    x = 1.3;
    y = -1.1;
    arktest.assertEQ(x % y, 0.19999999999999996);
    arktest.assertEQ(x % y, x - truncate(x / y) * y);

    x = -1.3;
    y = -1.1;
    arktest.assertEQ(x % y, -0.19999999999999996);
    arktest.assertEQ(x % y, x - truncate(x / y) * y);
}
