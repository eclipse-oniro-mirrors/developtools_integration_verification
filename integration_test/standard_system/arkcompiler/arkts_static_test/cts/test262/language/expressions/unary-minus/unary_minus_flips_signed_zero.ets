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

// arktsid: unary_minus_flips_signed_zero
// description: Unary minus flips the sign of zero

function main(): void {
    let positiveZero: double = 0.0;
    positiveZero = -positiveZero;
    arktest.assertNegativeZero(positiveZero);

    let negativeZero: double = -0.0;
    negativeZero = -negativeZero;
    arktest.assertPositiveZero(negativeZero);
}
