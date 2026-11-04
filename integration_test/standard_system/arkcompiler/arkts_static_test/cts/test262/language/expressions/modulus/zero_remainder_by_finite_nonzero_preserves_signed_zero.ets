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

// arktsid: zero_remainder_by_finite_nonzero_preserves_signed_zero
// description: Zero remainder by a finite non-zero value preserves zero sign

function main(): void {
    arktest.assertPositiveZero(0.0 % 1.0);
    arktest.assertPositiveZero(0.0 % -1.0);
    arktest.assertNegativeZero(-0.0 % 1.0);
    arktest.assertNegativeZero(-0.0 % -1.0);
    arktest.assertPositiveZero(0.0 % Number.MAX_VALUE);
    arktest.assertPositiveZero(0.0 % Number.MIN_VALUE);
    arktest.assertNegativeZero(-0.0 % Number.MAX_VALUE);
    arktest.assertNegativeZero(-0.0 % Number.MIN_VALUE);
}
