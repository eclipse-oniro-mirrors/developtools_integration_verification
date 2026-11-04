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

// arktsid: exp_operator_precedence_update
// description: Exponentiation Operator expression precedence of update operators

function main(): void {
    let base: int = 4;
    arktest.assertEQ(--base ** 2, 9);
    arktest.assertEQ(++base ** 2, 16);
    arktest.assertEQ(base++ ** 2, 16);
    arktest.assertEQ(base-- ** 2, 25);

    base = 4;
    // --base ** --base ** 2 -> 3 ** 2 ** 2 -> 3 ** (2 ** 2) -> 81
    arktest.assertEQ(--base ** --base ** 2, 81);

    // ++base ** ++base ** 2 -> 3 ** 4 ** 2 -> 3 ** (4 ** 2) -> 43046721
    arktest.assertEQ(++base ** ++base ** 2, 43046721);

    base = 4;
    // base-- ** base-- ** 2 -> 4 ** 3 ** 2 -> 4 ** (3 ** 2) -> 262144
    arktest.assertEQ(base-- ** base-- ** 2, 262144);

    // base++ ** base++ ** 2 -> 2 ** 3 ** 2 -> 2 ** (3 ** 2) -> 512
    arktest.assertEQ(base++ ** base++ ** 2, 512);
}
