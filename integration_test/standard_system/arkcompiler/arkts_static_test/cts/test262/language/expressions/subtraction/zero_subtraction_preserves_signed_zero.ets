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

// arktsid: zero_subtraction_preserves_signed_zero
// description: Subtraction of signed zeros follows IEEE 754 sign rules

function main(): void {
    arktest.assertPositiveZero(-0.0 - -0.0);
    arktest.assertPositiveZero(0.0 - -0.0);
    arktest.assertNegativeZero(-0.0 - 0.0);
    arktest.assertPositiveZero(0.0 - 0.0);
}
